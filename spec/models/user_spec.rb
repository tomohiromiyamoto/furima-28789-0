require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザの新規登録' do
    context '登録できる', can_save: true do
      it 'すべて正しい入力' do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end
    end

    context '登録できない', cant_save: true do
      it 'emailが空だと登録できない' do
        user = build(:user)
        user.email = ''
        user.valid?
        expect(user.errors[:email]).to include('can\'t be blank')
      end
      it 'emailは重複できない' do
        first_user = build(:user)
        second_user = build(:user)
        first_user.save!
        second_user.valid?
        expect(second_user.errors[:email]).to include('has already been taken')
      end
      it 'passwordは6桁以上の英数字' do
        user = build(:user)
        user.password = '123456'
        user.valid?
        expect(user.errors[:password]).to include('には英字と数字の両方を含めて設定してください')
      end
      it 'nicknameが空だと登録できない' do
        user = build(:user)
        user.nickname = ''
        user.valid?
        expect(user.errors[:nickname]).to include('can\'t be blank')
      end
      it 'last_nameはかな/カナもしくは漢字でなければならない' do
        user = build(:user)
        user.last_name = 'testman'
        user.valid?
        expect(user.errors[:last_name]).to include('名前は全角で入力してください')
      end
      it 'first_nameはかな/カナもしくは漢字でなければならない' do
        user = build(:user)
        user.first_name = 'testman'
        user.valid?
        expect(user.errors[:first_name]).to include('名前は全角で入力してください')
      end
      it 'last_name_kanaはカタカナでなければならない' do
        user = build(:user)
        user.last_name_kana = 'てすとまん'
        user.valid?
        expect(user.errors[:last_name_kana]).to include('フリガナはカタカナで入力してください')
      end
      it 'first_name_kanaはカタカナでなければならない' do
        user = build(:user)
        user.first_name_kana = 'てすとまん'
        user.valid?
        expect(user.errors[:first_name_kana]).to include('フリガナはカタカナで入力してください')
      end
      it 'birth_dayは空では登録できない' do
        user = build(:user)
        user.birth_day = ''
        user.valid?
        expect(user.errors[:birth_day]).to include('can\'t be blank')
      end
    end
  end
end