require "rails_helper"

RSpec.describe "Unfollowing friend" do
	before do
		@u1 = create :user
		@u2 = user_with_exercises

		login_as(@u1)

		@following = Friendship.create(user: @u1, friend: @u2)
	end

	scenario "when logged in" do
		visit "/"

		click_link "My Workouts"
		link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
		find(link).click()

		expect(page).to have_content("#{@u2.full_name} unfollowed")  
	end

end