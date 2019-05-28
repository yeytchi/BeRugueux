class OffersController < ApplicationController

  def new
  end

  def create
    current_season = Season.find(params[:season_id])
    current_team = Team.find(params[:team_id])
    offer = Offer.new(offer_params)
    offer.save!
    redirect_to season_team_path(current_season, current_team)
  end

  private

  def offer_params
    params.require(:offer).permit(:amount, :player_id, :team_id)
  end
end
