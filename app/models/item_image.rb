class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader

  validates :image,  presence: { message: "名前を入力してください" }
end
