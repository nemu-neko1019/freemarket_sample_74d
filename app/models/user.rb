class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todo_lists, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  accepts_nested_attributes_for :sending_destination
  has_many :user_reviews
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :buyer_items, class_name: 'Item', :foreign_key => 'buyer_id'
  has_many :seller_items, class_name: 'Item', :foreign_key => 'seller_id'
end
