FactoryBot.define do
  factory :exercise do
    duration_in_min { 1 }
    workout { "MyText" }
    workout_date { "2021-11-24" }
    user { nil }
  end
end
