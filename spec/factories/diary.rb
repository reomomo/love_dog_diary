FactoryBot.define do
  factory :diary do
    user_id { 1 }
    my_dog_id { 1 }
    diary_date { "2023年5月7日" }
    memo { Faker::Lorem.characters(number:20) }
    appetite { "excellent" }
    excreta { "usually" }
  end

end