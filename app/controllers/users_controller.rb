class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit]


	def index
		@users = User.all
		@book = Book.new
		@user = current_user
	end

	def show
		# ↓投稿表示 each
		# ↓部分テンプレート
		@book = Book.new
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def correct_user
    	user = User.find(params[:id])
    if user != current_user
      	redirect_to user_path(current_user)
    end
  end
end
