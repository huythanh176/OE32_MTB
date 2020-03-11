class TheatersController < ApplicationController
  before_action :find_theater, only: :show

  def index
    @theaters = Theater.sort.paginate page: params[:page]
  end

  def show
    @movies = Movie.pluck(:id, :name, :status)
    @schedules = Schedule.get_schedule_by_day(params[:start_at].nil? == true ?
                                  Time.now.strftime(Settings.date.format) : params[:start_at])
  end

  private

  def find_theater
    @theater = Theater.find_by id: params[:id]
    return if @theater
    flash[:danger]= t "theaters.not_found"
    redirect_to root_url
  end
end
