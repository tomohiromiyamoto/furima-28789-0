class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture


  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'が設定可能範囲を超えています' }
  with_options presence: true do
    validates :images
    validates :name
    validates :introduction
    validates :condition
    validates :price
    validates :delivery_fee
    validates :delivery_days
  end
  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id
    validates :prefecture_id
  end

  enum condition: {
    '新品同様': 0,
    '未使用に近い': 1,
    '目立った傷や汚れなし': 2,
    'やや傷や汚れあり': 3,
    '傷や汚れあり': 4,
    '全体的に状態が悪い': 5
  }
  enum delivery_fee: {
    '送料込み（出品者負担）': 0,
    '着払い（購入者負担）': 1
  }
  enum delivery_days: {
    '1~2日で発送': 0,
    '2~3日で発送': 1,
    '4~7日で発送': 2
  }
end