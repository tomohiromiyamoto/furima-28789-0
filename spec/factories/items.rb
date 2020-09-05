FactoryBot.define do
  factory :item do
    name { 'test' }
    introduction { 'test' }
    condition { 1 }
    price { 9_999_999 }
    delivery_fee { 1 }
    delivery_days { 1 }
    category_id { 1 }
    prefecture_id { 1 }
    user
    trait :image do
      image { item_test_file_upload(Rails.root.join('spec/item_test/images.jpeg')) }
    end
  end
end
