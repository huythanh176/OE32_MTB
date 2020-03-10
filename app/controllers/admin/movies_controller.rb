class Admin::MoviesController < ApplicationController
  before_action :find_movie, only: :edit

  def index
    @movies = Movie.search_by_name(params[:search]).sort_by_newest.paginate page: params[:page], per_page: Settings.movie.admin_paginate
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
