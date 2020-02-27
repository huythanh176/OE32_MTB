class SessionController < ApplicationController
  before_action :find_by_email, only: :create

  def new; end

  def create
    if @user.authenticate params[:session][:password]
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = t "users.signin.invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def find_by_email
    @user = User.find_by email: params[:session][:email].downcase
    return if @user
    flash[:danger]= t "users.not_found"
    redirect_to root_url
  end
end
