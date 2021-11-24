require "rails_helper"

RSpec.describe "User registration form" do
	scenario "with valid credentials" do
			visit root_path
			# sleep(5)

			click_link "Sign out"
			expect(page).to have_content("Signed out successfully.")
			expect(page).to	have_current_path(root_path)
	end
end
