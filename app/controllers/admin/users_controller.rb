class Admin::UsersController < Admin
  before_action :find_user, only: :destroy

  def index
    @users = User.sort_by_newest.paginate page: params[:page] , per_page: Settings.user.per_page
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger]= t "users.not_found"
    redirect_to root_url
  end
end
