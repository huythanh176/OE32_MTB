class StaticPagesController < ApplicationController
  def home
    @movies_is_showing = Movie.is_showing.sort_by_newest.paginate page: params[:page], per_page: Settings.movie.home_paginate
    @movies_is_comming = Movie.is_comming.sort_by_newest.paginate page: params[:page], per_page: Settings.movie.home_paginate
  end

  def help; end

  def about; end

  def contact; end
end
