class OffersController < ApplicationController

  def create
    current_season = Season.find(params[:season_id])
    current_team = Team.find(params[:team_id])
    offer = Offer.new(offer_params)
    offer.save!
    # redirect_to season_team_path(current_season, current_team)
    redirect_to season_team_players_path(current_season, current_team)
  end

  def update
    current_season = Season.find(params[:season_id])
    current_player = Player.find(params[:player_id])
    current_team = Team.find(params[:team_id])
    offer = Offer.where(team: current_team, player: current_player)

    @offer.update(offer_params)
    @offer.save!
    # redirect_to season_team_path(current_season, current_team)
    redirect_to season_team_players_path(current_season, current_team)
  end

  private

  def offer_params
    params.require(:offer).permit(:amount, :player_id, :team_id)
  end
end
