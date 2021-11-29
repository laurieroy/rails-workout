require "rails_helper"

RSpec.describe "Listing exercise" do
	before do
		driven_by(:rack_test)
		@user = create :user
		login_as(@user)
		@e1 = @user.exercises.create(duration_in_min: 20,
																 workout: "Recumbent bike",
																 workout_date: Date.today)
		@e2 = @user.exercises.create(duration_in_min: 20,
																 workout: "Yoga",
																 workout_date: 2.days.ago)
		@e3 = @user.exercises.create(duration_in_min: 30,
																 workout: "Exercise over a week ago",
																 workout_date: 9.days.ago)
	end

	scenario "shows user's workouts for the past 7 days" do
		visit "/"

		click_link "My Workouts"

		expect(page).to have_text(@e1.duration_in_min)
		expect(page).to have_text(@e1.workout)
		expect(page).to have_text(@e1.workout_date)

		expect(page).to have_text(@e2.duration_in_min)
		expect(page).to have_text(@e2.workout)
		expect(page).to have_text(@e2.workout_date)

		expect(page).to_not have_text(@e3.duration_in_min)
		expect(page).to_not have_text(@e3.workout)
		expect(page).to_not have_text(@e3.workout_date)
	end

	scenario "shows no exercises if none are created yet" do
		@new_user = create :user
		login_as(@new_user)

		visit "/"

		click_link "My Workouts"

		expect(page).to have_text("No Workouts yet")
	end
end