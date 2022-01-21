class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@friend = User.find(params[:friend_id])
		params[:user_id] = current_user.id
		
		Friendship.create(friendship_params) unless current_user.follows_or_same?(@friend)
		if @friend.save
		flash[:notice] = "Following #{@friend.full_name}"
		else
			flash[:notice] = "Unable to follow friend. Try again"
		end
		redirect_to root_path
	end

	private

	def friendship_params
		params.permit(:friend_id, :user_id)
	end
end
