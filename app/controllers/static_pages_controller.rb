class StaticPagesController < ApplicationController
  def home
    @movies = Movie.sort.paginate page: params[:page], per_page: 4
  end

  def help; end

  def about; end

  def contact; end
end
