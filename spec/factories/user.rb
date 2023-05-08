FactoryBot.define do
  factory :user do
    email { "taro@gmail" }
    last_name { "田中" }
    first_name { "太郎" }
    user_name { "タロウ" }
  end
end