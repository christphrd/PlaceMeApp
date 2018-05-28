class UsersController < ApplicationController
  before_action :get_user, only: [:home, :show]
  before_action :require_login
  before_action :authorize_page, only: [:home]
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.places.build
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to "/home/#{@user.id}"
  end

  def show

  end

  def home

  end

  def edit
    @user = session_user
  end

  def update
    @user = session_user
    user_params[:bio] = nil if user_params[:bio] == ""
    @user.update_column(:bio, user_params[:bio])
    redirect_to '/'
  end


  private
  #
  # def authorize_page
  #   return head(:forbidden) unless session[:user_id] == @user.id
  # end
  #
  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

  # def get_user
  #   @user = User.find(params[:id])
  # end


  def user_params
    # params.each { |key, value| value.strip!}
    params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, :password_confirmation, :places_attributes => [:name, :country])
  end
end
