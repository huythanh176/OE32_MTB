class UsersController < ApplicationController
  before_action :find_user, only: :show

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:info] = t "users.signup.success"
      redirect_to user_path
    else
      flash.now[:danger] = t "users.signup.fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email,:phone, :gender, :birthday,
                                 :password, :password_confirmation
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger]= t "users.not_found"
    redirect_to root_url
  end
end
