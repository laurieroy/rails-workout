require "rails_helper"

RSpec.describe "Listing exercise" do
	before do
		@u1 = create :user
		@u2 = user_with_exercises

		login_as(@u1)

		@following = Friendship.create(user: @u1, friend: @u2)
	end

	scenario "shows friend's workouts for the past 7 days" do
		visit "/"

		click_link "My Workouts"
		click_link @u2.full_name

		expect(page).to have_text("#{@u2.full_name}'s Exercises")
		expect(page).to have_content(@u2.exercises.first.workout)
	end
end