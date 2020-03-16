class Admin::SchedulesController < ApplicationController
  before_action :check_is_admin

  def index
    @schedules = Schedule.sort_by_newest.paginate page: params[:page]

  end

  def new
    @schedule = Schedule.new
  end
end
