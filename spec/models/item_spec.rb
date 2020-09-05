require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品を出品できる' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '画像は1枚必須であること' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Images can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category を選択してください')
    end

    it '商品の状態についての情報が必須であること' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.delivery_days = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture を選択してください')
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300未満はNG' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price が設定可能範囲を超えています')
    end

    it '価格の範囲が、¥9,999,999以上はNG' do
      @item.price = '10000000'
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include('Price が設定可能範囲を超えています')
    end
  end
end
