require "rails_helper"

RSpec.describe "User sign out" do
	scenario "with valid credentials" do
			@user = create(:user)
			login_as(@user)

			visit root_path

			click_link "Sign out"

			expect(page).to have_content("Signed out successfully.")
			expect(page).to	have_current_path(root_path)
	end
end
