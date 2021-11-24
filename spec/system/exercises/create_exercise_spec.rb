require "rails_helper"

RSpec.describe "Creating exercise" do
	before do
		@user = create :user
		login_as(@user)
	end

	scenario "with valid inputs" do
		visit "/"

		click_link "My Workouts"
		click_link "New Workout"

		expect(page).to have_link("Back")

		fill_in "Duration",	with: 70
		fill_in "Workout Details",	with: "Yoga"
		fill_in "Activity date",	with: "2021-11-24" 
		click_button "Create Exercise"

		expect(page).to have_content("Exercise has been created")

		exercise = Exercise.last

		expect(have_current_path).to have_current_path(user_exercise_path(@user, exercise))
		expect(exercise.user_id).to eq(@user.id)
	end

	scenario "with invalid inputs" do

	end
end