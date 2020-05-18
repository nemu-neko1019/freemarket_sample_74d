class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    # @brand = Brand.new
    @item = Item.new
    @item.build_brand
  end

  def create
    binding.pry
    @item = Item.new
    @item.build_brand
    @item.save
    # Brand.new(brand_params[:brand]) 
    # Item.new(item_params)
    redirect_to root_path
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
  
  # def brand_params
  #   params.require(:brand).permit(:name)
  # end  

  def item_params
    params.require(:item).permit(:name, :introduction, :price, 
    :category_id,:condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id,:ids,
    brand_attributes: [
     :name
    ])
    
  end

end
