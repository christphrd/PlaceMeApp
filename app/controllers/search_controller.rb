class SearchController < ApplicationController
  before_action :require_login
  
  def search
    @region = params[:q]
    if !Place.where(country: @region).limit(Place.all.size).empty?
      @search_places = Place.where(country: @region).limit(Place.all.size)
    elsif !Place.where(continent: @region).limit(Place.all.size).empty?
      @search_places = Place.where(continent: @region).limit(Place.all.size)
    else
      redirect_to '/'
    end
  end

end
