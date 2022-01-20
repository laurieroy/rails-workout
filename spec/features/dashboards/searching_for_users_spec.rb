require "rails_helper"

RSpec.describe "Searching for user" do
	before do
		@u1 = create(:user, last_name: "Doe")
		@u2 = create(:user, last_name: "Doe")
	end

	scenario "with name of existing user returns all matches" do
		visit root_path

		fill_in "search_name",	with: "Doe" 
		click_button "Search"

		expect(page).to have_content(@u1.full_name) 
		expect(page).to have_content(@u2.full_name) 
		expect(current_path).to eq("/dashboards/search") 
	end
end