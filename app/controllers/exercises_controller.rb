class ExercisesController < ApplicationController
	before_action :set_exercise, only: %i[show edit update destroy]

	def index
		# @exercises = current_user.all
		@exercises = current_user.exercises.past_week
	end

	def show
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
	end

	def update 
		if @exercise.update(exercise_params)
			flash[:notice] = "Exercise has been updated"
			redirect_to [current_user, @exercise]
		else
			flash[:alert] = "Something went wrong, please try again"
			render :edit
		end
	end

	def destroy
		@exercise.destroy
		flash[:notice] = "Excercise has been deleted"
		redirect_to user_exercises_path(current_user)
	end

	private
	def exercise_params
		params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
	end
	
	def set_exercise
		@exercise = current_user.exercises.find(params[:id])
	end
end