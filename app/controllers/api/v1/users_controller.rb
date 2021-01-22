class Api::V1::UsersController < ApplicationController

	def index
		@users = User.all
		render json:@users
	end

	def show
		@user = User.find(params[[:id]])
		render jseon: @user
	end

	def create
		@user = User.new(user_params)
		if@user.save
			render json: @user
		else
			render error:{error: "failed to create user"}
		end
	end
end