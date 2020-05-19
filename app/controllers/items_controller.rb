class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    # @item.build_category
    @item.build_brand
    @item.item_images.build
    @parents = Category.all.order("id ASC").limit(13)
    @item.item_images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
   end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      # category_id = Category.find(@item.id).id
      brand_id = Brand.find(@item.id).id
      item = Item.find(@item.id)
      item.update(brand_id: brand_id)
      # item.update(category_id: category_id,brand_id: brand_id)
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
      :buyer_id,
      :deal_closed_date,
      category_attributes: [
        :name
      ],
      brand_attributes: [
        :name
      ], item_image_attributes: [
        :image,
        :ids
        ]).merge(seller_id: current_user.id)
    
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
