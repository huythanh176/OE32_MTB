class Admin::SchedulesController < ApplicationController
  authorize_resource

  def index
    @schedules = Schedule.sort_by_newest.paginate page: params[:page]

  end

  def new
    @schedule = Schedule.new
  end
end
