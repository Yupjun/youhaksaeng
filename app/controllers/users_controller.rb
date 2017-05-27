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
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to root_url
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render 'new'
    end
  end
    
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to signin_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :campus, :nationality)
  end
end
