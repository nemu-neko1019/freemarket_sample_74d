class PurchaseController < ApplicationController
  before_action :set_item, only: [ :index, :pay, :done]
  before_action :set_card, only: :index
  require 'payjp'

  def index
    if @item.buyer_id.nil?
      @sending_destination = current_user.sending_destination
      @card = Card.where(user_id: current_user.id).first
      if card = blank?
        redirect_to card_new_path
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    else
      redirect_to root_path
    end
  end

  def pay
    if @item.buyer_id.nil? && @item.seller_id != current_user.id
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
        redirect_to action: 'done'
    else
      redirect_to root_path
    end
  end

  def done
    @item.update(buyer_id: current_user.id)
    if @item.buyer_id.nil?
      flash.now[:alert] = 'データの保存に失敗しました'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    card = Card.where(user_id: current_user.id)
  end

end
