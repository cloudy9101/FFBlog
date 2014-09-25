class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:sessions][:email])
  	if user.authenticate(params[:sessions][:password])
  		sign_in(user)
  		redirect_to user
  	else
  		redirect_to signin_url
  	end
  end

  def destroy
        sign_out
        redirect_to root_url
  end

end
