require "rails_helper"

RSpec.describe "User registration", js:true do
	scenario "with valid credentials" do
			visit root_path

			click_link "Sign up"

			expect(page).to	have_current_path(new_user_registration_path, wait: 3)

			@user = build(:user)
			# byebug
			within("#new_user") do
				fill_in :user_first_name, with: @user.first_name
				fill_in :user_last_name,	with: @user.last_name
				fill_in :user_email, with: @user.email
				fill_in :user_password, with: @user.password
				fill_in :user_password_confirmation, with: @user.password

				click_button "Sign up"
			end


			expect(page).to have_content("You have signed up successfully")
			# expect(page).to have_content("Welcome, #{@user.email}!")
			expect(page).to have_content("Signed in as #{@user.email}")

	end
end