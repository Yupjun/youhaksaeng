class PostsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destory]
  load_and_authorize_resource
  
  def index
    # @posts = Post.search(params[:search])
    @posts = Post.all
    # @@meta = params[:search]
    # if params[:search] == "title"
    #   @posts = Post.where("title like ?", "%#{params[:post]}%")
    # elsif params[:search] == "body"
    #   @posts = Post.where("body like ?", "%#{params[:post]}%")
    # elsif params[:search] == "campus"
    #   @posts = Post.where("campus like ?", "%#{params[:post]}%")
    # elsif params[:search] == "nationality"
    #   @posts = Post.where("nationality like ?", "%#{params[:post]}%")
    # elsif
    #   @posts = Post.where("nickname like ?", "%#{params[:post]}%")
    # else
    #   @posts = Post.all
    # end
    
    
  end

  def create
    @post = Post.new(post_params)
    @post.save
    
    redirect_to @post
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post: @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_url
  end
  
  def search_index
    @posts = Post.search(params[:search], params[:category])
  end

  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :category_id, :nickname, :nationality, :campus)
  end
  
  def search_params
    params.require(:search).permit(:search, :post)
  end
end
  

