require "rails_helper"

RSpec.describe "Following friends" do
	before do
		@u1 = create(:user)
		@u2 = create(:user)

		login_as(@u1)
	pp @u1
	pp @u2
	end

	scenario "if signed in" do
			visit root_path

			expect(page).to have_content(@u1.full_name) 
			expect(page).to have_content(@u2.full_name) 

			href1 = "/friendships?friend_id=#{@u1.id}"
			href2 = "/friendships?friend_id=#{@u2.id}"
			link = "a[href='#{href2}']"

			expect(page).to have_no_link("Follow", href: :href1) 

			find(link).click

			expect(page).to have_no_link("Follow", href: :href2) 
	end
end