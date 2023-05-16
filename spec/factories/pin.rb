FactoryBot.define do
  factory :pin do
    user_id { 1 }
    stroll_id { 1 }
    latitude { 0.354381e2 }
    longitude { 0.139352e3 }
    distance { 0 }
    title { "今日はのんびりお散歩" }
  end
end