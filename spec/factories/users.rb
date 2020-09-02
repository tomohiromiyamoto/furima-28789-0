FactoryBot.define do
  factory :user do
    email           { 'test@test' }
    password        { 'test1234' }
    nickname        { 'test' }
    last_name       { '山田' }
    first_name      { '太郎' }
    last_name_kana  { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day       { '1930-01-01' }
  end
end