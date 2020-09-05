FactoryBot.define do
  factory :payment_form do
    token { 'testcard' }
    postal_code { '000-0000' }
    prefecture_id { 9 }
    city { '新宿区' }
    address { '1-2' }
    phone_number { '07012345678' }
  end
end
