class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todo_lists, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  has_many :user_reviews
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :buyer_item, class_name: 'Item', :foreign_key => 'buyer_id'
  has_many :seller_item, class_name: 'Item', :foreign_key => 'seller_id'
end
