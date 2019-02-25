# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_katakana|string|null: false|
|first_name_katakana|string|null: false|
|birthday_info|date|null: false|
|address_id|reference|null: false, foreign_key: true|
|rate_id|reference|null: false, foreign_key: true|
|point|integer|null: false|
|proceed|integer|null: false|

### Association
- has_many :items
- belongs_to :address
- has_many :news
- has_many :todos
- has_many :rates
- has_many :trades
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
***

## addressテーブル
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

### Association
- belongs_to :user
***

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|

### Association
- belongs_to :user
***

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
***

## itemcommentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
***

## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_many :tradecomments
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
|price|integer|null: false|
|itemimage_id|reference|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: true, foreign_key: true|
|size_id|reference|null: true, foreign_key: true|
|shipping_id|reference|null: true, foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :item_comments
- belongs_to :trade
- belongs_to :shipping
- has_many :item_images
- has_many :categories
- belongs_to :size
- belongs_to :brand
***

## shippingsテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|null: false|
|shipping_charge|string|null: false|
|ship_from_region|string|null: false|
|shipping_date|string|null: false|

### Association
- belongs_to :item
***

## itemimagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
|seller_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
***

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|ancestry|string|null: false, unique: true|

### Association
- belongs_to :item
***

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|category_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
***

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|category_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
***
