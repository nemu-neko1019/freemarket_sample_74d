class PurchaseController < ApplicationController
  before_action :set_item, only: [ :index, :pay, :done]
  require 'payjp'

  def index
    @sending_destination = current_user.sending_destination
    @card = Card.where(user_id: current_user.id).first
    if card = blank?
      redirect_to card_new_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    if Payjp::Charge.create
      redirect_to action: 'done'
    else
      redirect_to action: 'index'
    end

  end

  def done
    @item.update(buyer_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

end
