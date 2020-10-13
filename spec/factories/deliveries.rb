FactoryBot.define do
  factory :delivery do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '仙台市' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { "09044333000" }
    order_id {44}
  end
end
