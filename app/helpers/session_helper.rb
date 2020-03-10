module SessionHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    return current_user.present?
    redirect_to signin_path
  end

  def check_logged_in?
    unless
      current_user.present?
      redirect_to signin_path
    end
  end

  def current_user? user
    user == current_user
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end
end
