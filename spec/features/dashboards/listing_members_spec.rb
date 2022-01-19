require "rails_helper"

RSpec.describe "Listing Members" do
	before do
		@user1 = create :user
		@user2 = create :user
	end

	scenario "shows a list of registered members" do
		visit "/"

		expect(page).to have_content("List of Members")
		expect(page).to have_content( @user1.full_name  )
		expect(page).to have_content( @user2.full_name  )
	end
end