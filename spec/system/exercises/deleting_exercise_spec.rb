require "rails_helper"

RSpec.describe "Deleting exercise" do
	before do
		@user = create :user
		@exercise_to_delete = create :exercise
		@exercise_to_delete.user_id = @user.id
		login_as(@user)
	end

	scenario "succeeds with valid inputs" do
		visit "/"

		click_link "My Workouts"

		path = "/users/#{@user.id}/exercises/#{@exercise_to_delete.id}"
		link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"

		find(:xpath, link)

		expect(page).to have.text("Exercise has been deleted")
	end
end