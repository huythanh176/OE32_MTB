class MoviesController < ApplicationController
  before_action :find_movie, except: :create

  def show
    @comments = @movie.comments.sort_by_newest
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

  def update
    if @movie.update_attributes movie_params
      flash[:success] = t "movies.updated"
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      flash[:success] = t "movies.deleted"
    else
      flash[:danger] = t "movies.cant_delete"
    end
    redirect_to admin_movies_path
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
