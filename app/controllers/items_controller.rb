class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.item_images.build
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("選択してください")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.build_brand
      @item.item_images.build
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      @category_parent_array.unshift("選択してください")
      render action: :new
    end
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      @item.destroy
      redirect_to root_path
    end
  end

  def edit
    @item_images = ItemImage.where(item_id: params[:id])
    @item.item_images.build
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  def update
    @item_images = ItemImage.where(item_id: params[:id])
    if @item.update(item_update_params)
      redirect_to item_path(params[:id])
    else
      @item_images = ItemImage.where(item_id: params[:id])
      @item.item_images.build
      grandchild_category = @item.category
      child_category = grandchild_category.parent
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)
      @category_children_array = Category.where(ancestry: child_category.ancestry)
      @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
      render action: :edit
    end
  end

  def show
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

  def set_item
    @item = Item.find(params[:id])
  end
  

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
      brand_attributes: [
        :name
      ], item_images_attributes: [
        :image
      ]).merge(seller_id: current_user.id)
  end

  def item_update_params
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
        :image,
        :_destroy,
        :id
      ]).merge(seller_id: current_user.id)
  end

end
