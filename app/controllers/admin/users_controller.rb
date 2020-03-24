class Admin::UsersController < ApplicationController
  authorize_resource
  before_action :check_logged_in?, only: :index
  before_action :find_user, only: :destroy

  def index
    @users = User.sort_by_newest.paginate page: params[:page] , per_page: Settings.user.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.deleted"
    else
      flash[:danger] = t "users.cant_delete"
    end
    redirect_to admin_movies_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger]= t "users.not_found"
    redirect_to root_url
  end
end
