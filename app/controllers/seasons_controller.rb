class SeasonsController < ApplicationController
  before_action :set_season, only: [:show]

  def index
    if current_user.admin?
      @seasons = Season.all
    else
      @seasons = Season.where(user_id: current_user)
    end
  end

  def new
    @season = Season.new
  end

  def create
    @season = current_user.seasons.new(event_params)

    if @season.save
      redirect_to @season
    else
      render :new
    end
  end

  def show
    participants =
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end
end
