class SchedulesController < ApplicationController
  def index
    @theaters = Theater.pluck(:id, :name)
    @movies = Movie.pluck(:id, :name, :status)
    @schedules = Schedule.get_schedule_by_theater(params[:theater_id].nil? == true ?
                                  Settings.theater.default : params[:theater_id])
  end
end
