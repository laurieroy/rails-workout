require "rails_helper"

RSpec.describe "User registration" do
	scenario "with valid credentials" do
			visit root_path
			# sleep(5)

			click_link "Sign up"

			expect(page).to	have_current_path(new_user_registration_path, wait: 3)

			@user = create(:user)
			# byebug
			within("#new_user") do
				fill_in :user_email, with: @user.email
				fill_in :user_password, with: @user.password
				fill_in :user_password_confirmation, with: @user.password

				click_button "Sign up"
			end

			expect(page).to have_content("You have signed up successfully")
			# expect(page).to have_content("You have signed up successfully")
			# expect(page).to have_content("Welcome, #{email}!")

	end
end