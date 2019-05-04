class SeasonsController < ApplicationController
  def index
    if current_user.admin?
      @seasons = Season.all
    else
      @seasons = Season.where(user_id: current_user)
    end
  end

  def new
  end

  def create
  end

  def show
  end
end
