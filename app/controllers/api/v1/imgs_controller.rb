class Api::V1::ImgsController < ApplicationController

	def index
		@users = User.all
		render json:@users
	end

	def show
		@user = User.find(params[[:id]])
		render jseon: @user
	end

	def create
		img = User.new(user_params)
		img.image_file.attach(permitted_params[:image_file])
    	redirect_to image_path(new_image)
		if@img.save
			render json: @img
		else
			render error:{error: "failed to create user"}
		end
	end
end
