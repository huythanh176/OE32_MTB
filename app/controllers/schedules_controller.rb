class SchedulesController < ApplicationController
  def index
    @theaters = Theater.pluck(:id, :name)
    @movies = Movie.is_showing.sort_by_newest
    @schedules = Schedule.get_schedule_by_theater(params[:theater_id].nil? == true ?
                                  Settings.theater.default : params[:theater_id])
  end

  def create
    start_at = params[:schedule]["start_at(3i)"]+"-"+params[:schedule]["start_at(2i)"]+"-"+         params[:schedule]["start_at(1i)"]+" "+params[:schedule]["start_at(4i)"]+":"+         params[:schedule]["start_at(5i)"]
    @schedule = Schedule.new  start_at: start_at,
                              movie_id: params[:schedule][:movie_id],
                              room_id: params[:schedule][:room_id]
    if @schedule.save
      flash[:info] = "success"
      redirect_to admin_schedules_path
    else
      flash.now[:danger] = "fail"
      render :new
    end
  end

  def update
  end
end
