class PlacesController < ApplicationController
  before_action :get_place, only: [:show]
  before_action :require_login
  # before_action :authorize_page

  def index
    @places = Place.all
  end

  def new
    @user_place = UserPlace.new
  end

  def create
    @place = Place.find(place_params[:id])
    @user = User.find(session[:user_id])
    if @place
      @user_place = UserPlace.find_or_create_by(user_id: @user.id, place_id: @place.id)
      @user_place.update(user_place_params)
      redirect_to "/home/#{@user.id}"
    else
      render :new
    end
  end

  def add
    @place = Place.find(params[:id])
  end

  def added
    @place = Place.find(add_place_params[:id])
    @user = User.find(session[:user_id])
    if !params[:future]
      params[:future] = false
    end
    @user_place = UserPlace.find_or_create_by(user_id: @user.id, place_id: @place.id, future: params[:future])
    redirect_to place_path(@place)
  end

  def edit
    @user_place = UserPlace.find_by(place_id: params[:place_id], user_id: params[:id])
    @place = Place.find(params[:place_id])
  end

  def update
    @user_place = UserPlace.find_by(place_id: params[:place_id], user_id: params[:id])
    if !params[:future]
      params[:future] = false
    end
    @user_place.update(future: params[:future])
    redirect_to '/'
  end

  def destroy
    @user_place = UserPlace.find_by(place_id: params[:place_id], user_id: session[:user_id])
    @user_place.delete
    redirect_to '/'
  end

  def show
    @place_comments = @place.comments.reverse
  end

  private

  def get_place
    @place = Place.find(params[:id])
  end

  def place_params
    # params.each { |key, value| value.strip! }

    params.require(:city).permit(:id)
  end

  def user_place_params

    params.permit(:future)
  end

  def add_place_params
    params.permit(:future, :id)
  end
end
