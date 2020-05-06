# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|firstname|string|null: false|
|familyname|string|null: false|
|firstname_kana|string|null: false|
|familyname_kana|string|null: false|
|birthyear|date|null: false|
|birthmonth|date|null: false|
|birthday|date|null: false|
### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :user_reviews
- has_many :seller_items(foreign_key: "seller_id", class_name: "items")
- has_many :buyer_items(foreign_key: "buyer_id", class_name: "items")
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|introduction|text||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## sending_destinationテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|familyname|string|null: false|
|firstname_kana|string|null: false|
|familyname_kana|string|null: false|
|postalcode|integer(7)|null: false|
|prefecture_code|integer|null: false|
|municipal_district|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|list|text|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|bland_id|references|foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key|
|postage_id|references|null: false, foreign_key|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true, null: false|
|deal_closed_date|timestamp||
|trading_status|enum|null: false|
### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_images, dependent: :destroy
- has_one :userreview
- belongs_to :category
- belongs_to :active_hash :size
- belongs_to :active_hash :condition
- belongs_to :active_hash :postage_payer
- belongs_to :active_hash :preparation_day
- belongs_to :active_hash :postage_area
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|Image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## user_reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|review_id|references|null: false, foreign_key: true|
|review_comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :active_hash: review

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items


# Gem(active_hashを使用)

## prefecture
- id
- name

## sizes
- id
- size

## Conditions
- id
- itemcondition

## PostagePayer
- id
- postagepayer

## PreparationDays
- id
- preparationday

## PostageArea
- id
- postagearea

## reviews
- id
- review
