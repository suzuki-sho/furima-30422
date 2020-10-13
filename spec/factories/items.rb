FactoryBot.define do
  factory :item do
    title          {"ノートパソコン"}
    price          {3000}
    description    {"とても使いやすいです"}
    category_id    {2}
    state_id       {2}
    shipping_id    {2}
    area_id        {2}
    day_id         {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end