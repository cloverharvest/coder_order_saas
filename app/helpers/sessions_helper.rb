module SessionsHelper
  # session vs cookies method
  # logsin the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns the current logged in user, if any
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true, if the user is logged in, returns false otherwise
  def logged_in?
    !current_user.nil?
  end

  # logs out the user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
