# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |i|
	User.create(
		email: "user-#{i+1}@example.com", 
		first_name: "user-#{i+1}",
		last_name: "User",
		password: "password", 
		password_confirmation: "password"
	)
end

User.all.each do |u|
	3.times do |i|
		u.exercises.create(duration_in_min: i+1, workout: "workout#{i+1}", workout_date: Date.yesterday  )
	end
end

User.last.exercises.destroy