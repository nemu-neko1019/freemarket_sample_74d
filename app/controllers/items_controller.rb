class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    
    @item_image = 4.times{@item.item_images.build}
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("選択してください")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.unshift("選択してください")
      @item.build_brand
      @item_image = 5.times{@item.item_images.build}  
      render action: :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
    @category = @item.category
    @item_images = @item.item_images
    @seller = User.find(@item.seller_id)
    @brand = Brand.find(@item.brand_id)
    @condition = Condition.find(@item.condition_id)
    @postage_payer = PostagePayer.find(@item.postage_payer_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @preparationday = PreparationDay.find(@item.preparation_day_id)
  end

  def buy
  end

  def complete_buy
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
      :brand_id,
      :buyer_id,
      brand_attributes: [
        :name
      ], item_images_attributes: [
        :image
      ]).merge(seller_id: current_user.id)

  end

end
