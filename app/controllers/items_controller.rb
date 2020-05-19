class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def buy
  end

  def complete_buy
  end

  private
  

  def item_params
    params.require(:item).permit(
      :name,
      :introduction,
      :price, 
      :category_id,
      :condition_id,
      :postage_payer_id,
      :prefecture_id,
      :preparation_day_id,
      :buyer_id,
      :deal_closed_date,
      brand_attributes: [
        :name
      ], item_image_attributes: [
        :image,
        :id
    ]).merge(seller_id: current_user.id)
    
  end

end
