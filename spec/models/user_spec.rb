require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録が成功する時' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.email = @user.save
      another_user = @user
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email is invalid')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = 'aaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは6文字以上であること' do
      @user.password = 'a00000'
      @user.valid?
      expect('Password is invalid').to include
    end

    it 'パスワードは半角英数字混合であること' do
      @user.password = 'a12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      @user.last_name, @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid', "First name can't be blank", 'First name is invalid')
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.last_name, @user.first_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid', 'First name is invalid')
    end

    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      @user.last_name_kana, @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid', "First name kana can't be blank", 'First name kana is invalid')
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.last_name_kana, @user.first_name_kana = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid', 'First name kana is invalid')
    end

    it '生年月日が必須であること' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_day can't be blank")
    end
  end
end
