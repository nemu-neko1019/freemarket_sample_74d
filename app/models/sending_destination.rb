class SendingDestination < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :prefecture_code, :municipal_district, :housenumber, presence: true
  validates :postalcode, presence: true, format: {with: /\A\d{7}\z/}
  validates :phonenumber, presence: true, format: {with: /\A\d{10,11}\z/}
end
