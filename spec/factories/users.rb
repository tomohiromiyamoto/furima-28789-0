FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    email                 { 'kkk@gmail.com' }
    password              { '0000000' }
    password_confirmation { '0000000' }
    last_name             { '鈴木' }
    first_name            { '吾郎' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'ゴロウ' }
    birth_day { '2020/8/26' }
  end
end
