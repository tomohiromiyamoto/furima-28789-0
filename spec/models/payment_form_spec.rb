require 'rails_helper'

RSpec.describe PaymentForm, type: :model do
  describe '商品購入できる時' do
    before do
      @payment_form = FactoryBot.build(:payment_form)
    end

    it 'トークンが取得できない' do
      @payment_form.token = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では購入できない' do
      @payment_form.postal_code = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがない' do
      @payment_form.postal_code = '0000000'
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include('Postal code を入力してください')
    end

    it '都道府県が選択されていないと購入できない' do
      @payment_form.prefecture_id = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include('Prefecture を選択してください')
    end

    it '市区町村がないと購入できない' do
      @payment_form.city = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("City can't be blank")
    end

    it '住所がないと購入できない' do
      @payment_form.address = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では購入できない' do
      @payment_form.phone_number = nil
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号はハイフンが不要' do
      @payment_form.phone_number = '090-0909-0909'
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include('Phone number は11桁以内の数字（ハイフン不要）で入力してください')
    end

    it '電話番号が11桁以上では購入できない' do
      @payment_form.phone_number = '090909090909'
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include('Phone number は11桁以内の数字（ハイフン不要）で入力してください')
    end
  end
end
