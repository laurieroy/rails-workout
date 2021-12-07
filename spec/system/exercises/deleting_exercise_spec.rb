require "rails_helper"

RSpec.describe "Deleting exercise" do
	before do
		@user = create :user

		login_as(@user)
	end

	scenario "succeeds with valid inputs" do
		@exercise_to_delete = create(:exercise)
		@exercise_to_delete.user_id = @user.id

		visit "/"

		click_link "My Workouts", wait: 5

		# expect(page).to have_no.content("")
		expect(page).to have_text("No Workouts yet")

# 		path = "/users/#{@user.id}/exercises/#{@exercise_to_delete.id}"
# 		link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"
# # byebug
# 		find(:xpath, link)

		expect(page).to have.text("Exercise has been deleted")
	end
end