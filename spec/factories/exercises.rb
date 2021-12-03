FactoryBot.define do
  factory :exercise do
    duration_in_min { 1 }
    workout { "MyWorkout" }
    workout_date { Date.yesterday }
    user
  end
end
