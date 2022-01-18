require "rails_helper"

RSpec.describe "Editing exercise" do
	before do
		# @edited_user = create :user
		# @exercise_to_edit = create!(:exercise)
		# # @exercise_to_edit =  create :exercise(user: @edited_user)
		# @exercise_to_edit.user_id = @edited_user.id
		# login_as(@edited_user)
		@edited_user = user_with_exercises
		@exercise_to_edit =  @edited_user.exercises.first
		@exercise_to_edit.user_id = @edited_user.id
		@exercise_to_edit.workout = "exercise_to_edit"
		@exercise_to_edit.save

		login_as(@edited_user)
	end

	scenario "succeeds with valid inputs" do
		visit "/"
	
		click_link "My Workouts"

		# visit edit_user_exercise_path(@exercise_to_edit)
		path = "/users/#{@edited_user.id}/exercises/#{@exercise_to_edit.id}/edit"
		link = "a[href=\'#{path}\']"
		find(link, match: :first).click()

		fill_in "Duration",	with: 45
		click_button "Update Exercise"

		expect(page).to have_text("Exercise has been updated")
		expect(page).to have_content(45)
		expect(page).to_not have_content("(min): 1")
	end
end