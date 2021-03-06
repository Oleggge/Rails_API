class Api::V1::UsersController < ApplicationController

	def index
		@users = User.all
		render json: @users, status: 200
	end

	def create
    @user = User.new(user_params)
		if @user.save
			render status: :created
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end
 
	private
	
	def user_params
		params.require(:user).permit(:name)
	end

end