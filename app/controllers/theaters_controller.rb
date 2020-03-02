class TheatersController < ApplicationController
  before_action :find_theater, only: :show

  def index
    @theaters = Theater.sort.paginate page: params[:page]
  end

  def show; end

  private

  def find_theater
    @theater = Theater.find_by id: params[:id]
    return if @theater
    flash[:danger]= t "theaters.not_found"
    redirect_to root_url
  end
end
