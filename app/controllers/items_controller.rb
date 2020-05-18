class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      brand_id = Brand.find(@item.id).id
      item = Item.find(@item.id)
      item.update(brand_id: brand_id)
      redirect_to root_path
    else
      render action: :new
    end
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
      brand_attributes: [
        :name
      ], item_image_attributes: [
        :image,
        :ids
    ])
    
  end

end
