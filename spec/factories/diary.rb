FactoryBot.define do

  # factory :user do
  #   email { taro @gmail }
  #   last_name { "田中" }
  #   first_name { "太郎" }
  #   user_name { "タロウ" }
  #   id { 1 }
  # end
  # factory :my_dog do
  #   user_id { 1 }
  #   name { "レオ" }
  #   size { "小型犬" }
  # end
  factory :diary do
    user_id { 1 }
    my_dog_id { 1 }
    diary_date { "2023年5月7日" }
    memo { Faker::Lorem.characters(number:20) }
    appetite { "excellent" }
    excreta { "usually" }
  end

end