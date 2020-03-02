class StaticPagesController < ApplicationController
  def home
    @movies = Movie.sort.paginate page: params[:page], per_page: Settings.movie.home_paginate
  end

  def help; end

  def about; end

  def contact; end
end
