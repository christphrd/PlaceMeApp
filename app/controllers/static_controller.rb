class StaticController < ApplicationController
  before_action :logged_in?
  include SessionsHelper
  def welcome
    if logged_in?
      redirect_to "/home/#{@current_user.id}"
    end
  end

end
