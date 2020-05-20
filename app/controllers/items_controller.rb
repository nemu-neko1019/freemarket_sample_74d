class ItemsController < ApplicationController

  def index
    # @parents = Category.where(ancestry: nil)
    # @category_children1 = Category.where(parent_id: 1)
    # @category_children2 = Category.where(parent_id: 2)
    # @category_children3 = Category.where(parent_id: 3)
    # @category_children4 = Category.where(parent_id: 4)
    # @category_children5 = Category.where(parent_id: 5)
    # @category_children6 = Category.where(parent_id: 6)
    # @category_children7 = Category.where(parent_id: 7)
    # @category_children8 = Category.where(parent_id: 8)
    # @category_children9 = Category.where(parent_id: 9)
    # @category_children10 = Category.where(parent_id: 10)
    # @category_children11 = Category.where(parent_id: 11)
    # @category_children12 = Category.where(parent_id: 12)
    # @category_children13 = Category.where(parent_id: 13)
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item_image = 5.times{@item.item_images.build}
    @parents = Category.where(ancestry: nil)
    @category_children1 = Category.where(parent_id: 1)
    @category_children2 = Category.where(parent_id: 2)
    @category_children3 = Category.where(parent_id: 3)
    @category_children4 = Category.where(parent_id: 4)
    @category_children5 = Category.where(parent_id: 5)
    @category_children6 = Category.where(parent_id: 6)
    @category_children7 = Category.where(parent_id: 7)
    @category_children8 = Category.where(parent_id: 8)
    @category_children9 = Category.where(parent_id: 9)
    @category_children10 = Category.where(parent_id: 10)
    @category_children11 = Category.where(parent_id: 11)
    @category_children12 = Category.where(parent_id: 12)
    @category_children13 = Category.where(parent_id: 13)
    @items = Item.all.order(created_at: :desc)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    @item_images = params[:item_images]["image"].nil?
    if @item.save && @item_images
      params[:item_images]["image"].each do |a|
        @item_image = @item.item_images.create!(image: a, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.build_brand
      @item_image = 5.times{@item.item_images.build}  
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
      :brand_id,
      :buyer_id,
      brand_attributes: [
        :name
      ], item_images_attributes: [
        :id,
        :item_id,
        image:[]
      ]).merge(seller_id: current_user.id)
    
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
