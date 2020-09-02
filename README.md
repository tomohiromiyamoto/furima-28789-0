# テーブル設計

## users テーブル

| Column          | Type   | Option      |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |

### Association

-has_many :items
-has_many :comments, through: :items_comments
-has_many :buys
-has_many :item_purchases

## items テーブル

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| description   | text       | null: false       |
| category_id   | integer    | null: false       |
| condition     | integer    | null: false       |
| delivery_fee  | integer    | null: false       |
| delivery_days | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

-belongs_to :user
-has_many :comments, through: :items_comments
-has_one :buy
-has_one :item_purchase

## items_comments テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

## buys テーブル

| Column               | Type    | Option                         |
| -------------------- | ------- | ------------------------------ |
| postal_code          | string  | null: false                    |
| Prefectures_genre_id | integer | null: false                    |
| municipalities       | string  | null: false                    |
| block_number         | string  | null: false                    |
| building_name        | string  | null: false                    |
| telephone_number     | string  | null: false                    |
| item_id              | integer | null: false, foreign_key: true |

### Association

-has_one :item_purchase

## item_purchases テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

-belongs_to :item
-belongs_to :user
-belongs_to :buy
