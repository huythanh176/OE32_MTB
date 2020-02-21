class Admin::MoviesController < ApplicationController
  before_action :find_movie, only: :show

  def show; end

  def index
    @movies = Movie.sort.paginate page: params[:page] , per_page: Settings.movie.admin_paginate
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:info] = t "movies.create.success"
      redirect_to admin_movie_path
    else
      flash.now[:danger] = t "movies.create.fail"
      render :new
    end
  end

  private

  def find_movie
    @movie = Movie.find_by id: params[:id]
    return if @movie
    flash[:danger]= t "movies.not_found"
    redirect_to root_url
  end

  private

  def movie_params
    params.require(:movie).permit :name, :description, :time, :picture
  end
end
