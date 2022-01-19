require "rails_helper"

RSpec.describe "Deleting exercise", js: true do
	before do
		# driven_by(:selenium_chrome_headless)

		@user = user_with_exercises(exercises_count: 1)
		@exercise_to_delete = @user.exercises.first
		@exercise_to_delete.user_id = @user.id
		login_as(@user)
	end

	scenario "succeeds with valid inputs" do
		visit "/"

		click_link "My Workouts", wait: 5

		accept_alert do
			find_link("Destroy").click
		end

		expect(page).to have_text("Workout has been deleted")
	end
end