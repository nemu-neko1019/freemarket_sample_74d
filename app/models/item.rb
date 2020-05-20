class Item < ApplicationRecord

  has_one :user_review
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  belongs_to :category
  belongs_to :brand
  accepts_nested_attributes_for :brand
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_payer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :preparation_day
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # validates :name, :introduction, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, presence: true
  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

end
