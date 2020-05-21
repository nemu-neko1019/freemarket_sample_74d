class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card = blank?
      redirect_to card_new_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => card.customer_id,
      :currency => jpy,
    )
    redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:id])
    @item.update(buyer_id: currentuser.id)
  end

end
