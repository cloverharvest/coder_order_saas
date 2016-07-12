module SessionsHelper
  # session vs cookies method
  # logsin the user
  def log_in(user)
    session[:user_id] = user.id
  end
end
