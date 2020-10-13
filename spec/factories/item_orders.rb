FactoryBot.define do
  factory :item_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    area_id { 1 }
    municipality { '仙台市' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { "09044333000" }
    association :item 
    association :user
  end
end
