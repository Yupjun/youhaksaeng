class CommentsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destory]
  load_and_authorize_resource
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.save
    
    redirect_to post_path(@post)
  end

  # def destroy
  #   @post = Post.find(params[:id])
  #   @comment = @post.comments.find(params[:comment_id])
  #   @comment.destroy
    
  #   redirect_to post_path(@post)

  # end

  # def edit
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:comment_id])
   
  #   authorize! :update, @comment
    
  #   redirect_to post_path(@post)
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   @comment = @post.comments.find(params[:comment_id])
  #   @comment.update(comment_params)
    
  #   redirect_to @comment
  # end
  
  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
