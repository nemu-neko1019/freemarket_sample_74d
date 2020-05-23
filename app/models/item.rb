class Item < ApplicationRecord

  has_one :user_review
  has_many :item_images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :item_images, allow_destroy: true, reject_if: :all_blank
  belongs_to :category
  belongs_to :brand, optional: true
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
  validates :name, :introduction, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price, presence: true
  validates :category_id, presence: true, format:{with: /\A[0-9]+\z/}
  validates_associated :item_images
  validates :item_images, presence: true
  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

end
