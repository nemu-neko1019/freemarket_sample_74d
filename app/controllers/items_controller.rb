class ItemsController < ApplicationController

  def index
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
    @item = Item.find(params[:id])
    @seller = User.find(@item.seller_id)
    @category = Category.find(@item.category_id)
    @brand = Brand.find(@item.brand_id)
    @size = Size.find(@item.size_id)
    @condition = Condition.find(@item.condition_id)
    @postage_payer = PostagePayer.find(@item.postage_payer_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @preparationday = PreparationDay.find(@item.preparation_day_id)
  end

  def buy
  end

  def complete_buy
  end

end
