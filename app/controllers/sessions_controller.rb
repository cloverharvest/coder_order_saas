class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #must login user and redirect to user's show page
    else
      flash.now[:danger] = "Invalid email or password"
      render :new
    end
  end

  def destroy
  end
end
