class ExercisesController < ApplicationController
	def index
		@exercises = current_user.exercises.all
	end

	def show
		@exercise = current_user.exercises.find(id: params[:id]) 
	end

	def new
		@exercise = current_user.exercises.build
	end

	def create
		# @exercise.user_id = current_user.id
		@exercise = current_user.exercises.build(exercise_params)

		if @exercise.save
			flash[:notice] = "Exercise has been created"
			redirect_to [current_user, @exercise]
		else
			flash[:alert] = "Exercise has not been created"
			render :new
		end
	end

	def edit
		@exercise = current_user.exercises.find params[:id]
	end

	def update 
		@exercise = current_user.exercises.find params[:id]
		if @exercise.update(exercise_params)
			flash[:notice] = "Exercise has been updated"
			redirect_to [current_user, @exercise]
		else
			flash[:alert] = "Something went wrong, please try again"
			render :edit
		end
	end

	private
	def exercise_params
		params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
	end
	
end