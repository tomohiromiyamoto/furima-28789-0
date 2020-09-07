class PaymentForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number,
                :deal_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :token, presence: { message: 'can\'t be blank' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'は11桁以内の数字（ハイフン不要）で入力してください' }
  end

  def save
    deal = Deal.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id,
      city: city, address: address, building: building,
      phone_number: phone_number, deal_id: deal.id
    )
  end
end