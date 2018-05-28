class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize_page
    # byebug
    head(:forbidden) unless session[:user_id] == @user.id
  end

  def require_login
    # head(:forbidden) unless session.include? :user_id
    unless session.include? :user_id
      redirect_to '/'
    end
  end

  def get_user
    @user = User.find(params[:id])
  end

  def session_user
    @user = User.find(session[:user_id])
  end

end
