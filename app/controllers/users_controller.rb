class UsersController < ApplicationController
  def index
    @favorites = Favorite.where("user_id = ?", current_user.id)
    
  end
  
  def new
    @user = User.new
  end
  
  def favorites_add
    if current_user.favorites_addition(current_user.id, params[:category_id].to_i)
      redirect_to request.env['HTTP_REFERER']
    end
  end

  def favorites_delete
    if current_user.favorites_deletion(current_user.id, params[:category_id].to_i)
      redirect_to request.env['HTTP_REFERER']
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to posts_path
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render 'new'
    end
  end
    


  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :campus, :nationality)
  end
end
