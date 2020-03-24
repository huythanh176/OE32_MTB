class Admin::MoviesController < ApplicationController
  authorize_resource
  before_action :find_movie, only: :edit

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result.page(params[:page]).sort_by_newest.paginate page: params[:page], per_page: Settings.movie.admin_paginate
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  private

  def find_movie
    @movie = Movie.find_by id: params[:id]
    return if @movie
    flash[:danger]= t "movies.not_found"
    redirect_to root_url
  end
end
