class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @item.build_brand
    @item_image = 4.times{@item.item_images.build}
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
        @item.build_brand
      @item_image = 5.times{@item.item_images.build}  
      render action: :new
    end
  end

  def destroy
  end

  def edit
    @item = Item.find(params[:id])
    if Rails.env.production?
      client
    end
  end

  def update
  end

  def show
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
