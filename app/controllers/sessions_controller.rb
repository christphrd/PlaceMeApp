class SessionsController < ApplicationController
  #BOILERPLATE

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_to "/home/#{@user.id}"
      else
        render :new
      end
  end



  def destroy
    session.delete :user_id
    redirect_to '/'
  end


  def authorize_page
    return head(:forbidden) unless session[:user_id] == @user.id
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
