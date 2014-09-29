class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		if signed_in?
			@user = current_user
			flash[:info] = "您已经登陆。如需注册新用户，请先登出。"
			redirect_to @user
		else
			@user = User.new
		end
	end

	def create
		@user = User.new(permit_params)
		if @user.save
			sign_in @user
			flash[:success] = "欢迎加入FFBLOG！"
			redirect_to user_url(@user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if current_user.update(user_update_params)
			flash[:success] = "资料更新成功！"
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def permit_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def user_update_params
			params.require(:current_user).permit(:name, :password, :password_confirmation)
		end
end
