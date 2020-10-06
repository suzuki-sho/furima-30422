FactoryBot.define do
  factory :user do
    nickname              {"hotman"}
    email                 {"kkk@gmail.com"}
    password              {"999jjj"}
    password_confirmation {password}
    first_name            {"川村"}
    last_name             {"洋一"}
    f_name_kana           {"カワムラ"}
    l_name_kana           {"ヨウイチ"}
  end
end