class CommentsController < ApplicationController
  before_action :find_comment, only: :destroy

  def create
    if current_user.comments.new(comment_params).save
      flash[:info] = t "comments.create.success"
    else
      flash[:danger] = t "comments.create.fail"
    end
    redirect_to movie_path(id: params[:movie_id])
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "comments.deleted"
    else
      flash[:danger] = t "comments.cant_delete"
    end
    redirect_to session.delete(:return_to)
  end

  private

  def find_comment
    session[:return_to] ||= request.referer
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:danger]= t "comments.not_found"
    redirect_to root_url
  end

  def comment_params
    params[:comment][:movie_id] = params[:movie_id]
    params.require(:comment).permit :content, :movie_id
  end
end
