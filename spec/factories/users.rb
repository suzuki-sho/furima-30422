FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"川村"}
    last_name             {"洋一"}
    f_name_kana           {"カワムラ"}
    l_name_kana           {"ヨウイチ"}
    birthday              {"1945-01-01"}
  end
end