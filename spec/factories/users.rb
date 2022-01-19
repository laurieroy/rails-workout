FactoryBot.define do
  factory :user, aliases: [:athlete] do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

def user_with_exercises(exercises_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:exercise, exercises_count, user: user)
  end
end
