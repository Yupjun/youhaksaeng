class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    # user = User.find_by(email: params[:email])
    if user = User.find_by(email: params[:email])
      user = User.find_by(email: params[:email])
    elsif user = User.find_by(nickname: params[:email])
      user = User.find_by(nickname: params[:email])
    else
      user = nil
    end
    
    if user && user.authenticate(params[:password])
      # if user.email_confirmed
      #   sign_in user
      #   redirect_back_or user
      # else
      #   flash.now[:error] = 'Please activate your account by following the 
      #   instructions in the account confirmation email you received to proceed'
      #   render 'new'
      # end
      session[:user_id] = user.id
      redirect_to posts_path
      
    else 
      flash[:alert] = '아이디나 비밀번호를 잘못 입력하셨습니다.'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    @current_user = nil
    
    redirect_to posts_path
  end
    
end
