class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back(fallback_location: root_path)
      # redirect_to posts (not implemented yet)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    #redirect_to root_url
    redirect_back(fallback_location: root_path)
  end
end
