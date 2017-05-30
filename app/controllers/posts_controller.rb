class PostsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destory]
 
  load_and_authorize_resource
  
  def index
    @posts = Post.search(params[:search], params[:category]).paginate(page: params[:page], per_page: 5)
  
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      flash[:notice] = "number of characters"
      redirect_to @post
    end
  end

  def new
    @post = Post.new
    @posts = Post.all
    @categories = Category.all
    @minimum_length = Post.validators_on(:title ).first.options[:minimum]
    @maximum_length = Post.validators_on(:body ).first.options[:maximum]
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
    session[:return_to] ||= request.referer
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
  

