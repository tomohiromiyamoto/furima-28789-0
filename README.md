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
-has_many :deals
-has_many :buys
-has_many :item_purchases

## items テーブル

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| introduction  | text       | null: false       |
| category_id   | integer    | null: false       |
| condition     | integer    | null: false       |
| delivery_fee  | integer    | null: false       |
| delivery_days | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

-has_many_attached :images
-belongs_to        :user
-belongs_to        :category
-belongs_to        :prefecture
-has_one           :deal
-has_one           :buy
-has_one           :item_purchase

## deals テーブル

| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

## address テーブル

| Column         | Type       | Option            |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| city           | string     | null: false       |
| address        | string     | null: false       |
| building       | string     | null: false       |
| phone_number   | string     | null: false       |
| deal           | references | foreign_key: true |

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