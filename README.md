# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_info|date|null: false|
|icon|string|
|introduction|text|
|point|integer|null: false|
|proceed|integer|null: false|
|bought_items|reference|null: false, foreign_key: true|
|selling_items|reference|null: false, foreign_key: true|
|sold_items|reference|null: false, foreign_key: true|

### Association
- has_many :items
- has_one :address, dependent: :destroy
- has_many :news
- has_many :todos
- has_many :rates
- has_many :item_comments
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :likes, dependent: :destroy
- has_many :liked_items, through: :likes, source: :item
- has_many :payments
***

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|phone_number|string|

### Association
- belongs_to :user
***

## newsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
***

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
***

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|status|integer|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :trade
***

## itemcommentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item, dependent: :destroy
***

## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|status|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
- has_many :tradecomments
- has_one :rate
***

## tradecommentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|trade_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :trade
***

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|string|null: false|
|condition|string|null: false|
|shipping_method|string|null: false|
|shipping_charge|string|null: false|
|ship_from_region|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|
|size_id|reference|null: true, foreign_key: true|
|brand_id|reference|null: true, foreign_key: true|

### Association
- belongs_to :user
- has_many :item_images
- has_many :item_categories
- has_many :categories, through: :item_categories
- has_many :item_comments
- has_one :trade
- belongs_to :size
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user
***

## itemimagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item, dependent: :destroy
***

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user, dependent: :destroy
- belongs_to :item, dependent: :destroy
***

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|parent_id|integer|
|name|string|null: false, unique: true|

### Association
- has_many :item_categories
- has_many :items, through: :item_categories
***

## item_categoriesテーブル（中間テーブル）
|item_id|reference|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category
***

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :items
***

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
- has_many :items
***

### likesテーブル（中間テーブル）
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, index: true|
|item_id|integer|null: false, foreign_key: true, index: true|
### Association
- belongs_to :user
- belongs_to :item
***

### paymentsテーブル（190318追加）
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, index: true|
|customer_id|integer|null: false, foreign_key: true, index: true|
### Association
- belongs_to :user
***
