class SessionsController < ApplicationController
  def new
      if signed_in?
            flash[:info] = "您已经登陆。"
            redirect_to current_user
      end
  end

  def create
  	@user = User.find_by(email: params[:sessions][:email])
  	if @user && @user.authenticate(params[:sessions][:password])
  		sign_in(@user)
                flash[:success] = "欢迎回来 #{@user.name}"
  		redirect_to @user
  	else
                flash.now[:danger] = "用户名或密码不正确！"
  		render 'new'
  	end
  end

  def destroy
        sign_out
        redirect_to root_url
  end

end
