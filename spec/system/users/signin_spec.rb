require "rails_helper"

RSpec.describe "User sign in" do
	scenario "with valid credentials" do
			visit root_path
			# sleep(5)

			click_link "Sign in"

			expect(page).to	have_current_path(new_user_session_path, wait: 3)

			@user = create(:user)

			within("#new_user") do
				fill_in :user_email, with: @user.email
				fill_in :user_password, with: @user.password

				click_button "Log in"
			end

			expect(page).to have_content("Signed in successfully")
			expect(page).to have_content("Signed in as #{@user.email}")
			expect(page).not_to have_content("Sign up")
			expect(page).not_to have_content("Sign in")
			expect(page).to have_content("Sign out")
	end
end