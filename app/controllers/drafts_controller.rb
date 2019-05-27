class DraftsController < ApplicationController

  def new
  end

  def create
    season = Season.find(params[:season_id])
    team = Team.find(params[:team_id])
    draft = Draft.new(draft_params)
    draft.team = team
    draft.save!
    redirect_to season_team_players(@season, @team)
  end

  private

  def draft_params
    params.require(:draft).permit(:amount, :player)
  end
end
