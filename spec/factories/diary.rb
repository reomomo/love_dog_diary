FactoryBot.define do
  factory :diary do
    diary_date { '2023/5/7' }
    memo { Faker::Lorem.characters(number:20) }
    appetite { '多い' }
    excreta { '普通' }
  end
end