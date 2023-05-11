FactoryBot.define do
  factory :stroll do
    user_id { 1 }
    my_dog_id { 1 }
    diary_id { 1 }
    start_time { "7:30" }
    end_time { "8:30" }
    vitality_condition { "usually" }
    memo { "今日はのんびりお散歩" }
  end
end