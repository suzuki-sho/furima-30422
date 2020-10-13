class ItemOrder

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality, :address, :building, :phone_number
  attr_accessor :token
  validates :token, presence: true
  with_options presence: true do
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :area_id, :municipality, :address, :phone_number
  end
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, length: { maximum: 11 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end