require "rails_helper"

RSpec.describe "Creating exercise" do
	before do
		driven_by(:rack_test)
		@user = create :user
		login_as(@user)
		visit "/"

		click_link "My Workouts"
		click_link "New Workout"
		
		expect(page).to have_link("Back")
	end

	scenario "with valid inputs" do
		fill_in "Duration",	with: 70
		fill_in "Workout Details", with: "Yoga"
		fill_in "Activity Date", with: 3.days.ago 
		click_button "Create Exercise"

		expect(page).to have_text("Exercise has been created")

		exercise = Exercise.last

		# expect(current_path).to have_current_path(user_exercise_path(@user, exercise))

		expect(exercise.user_id).to eq(@user.id)
	end

	scenario "with invalid inputs" do


		expect(page).to have_link("Back")

		fill_in "Duration",	with: "abc"
		fill_in "Workout Details",	with: ""
		fill_in "Activity Date",	with: "" 
		click_button "Create Exercise"

		expect(page).to have_text("Exercise has not been created")
		expect(page).to have_text("Duration in min is not a number")
		expect(page).to have_text("Workout details can't be blank")
		expect(page).to have_text("Workout date can't be blank")
	end
end