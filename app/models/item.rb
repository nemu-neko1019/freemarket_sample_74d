class Item < ApplicationRecord
  has_one :user_review
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to :brand
  has_many :comments, dependent: :destroy
  has_many :favorites
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
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
  belongs_to_active_hash :category_choice
  
  validates :name, :detail, :category, :condition, :postage_payer, :prefecture, :preparation_day, :price, presence: true
end
