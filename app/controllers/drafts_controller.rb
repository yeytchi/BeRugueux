class DraftsController < ApplicationController

  def new
  end

  def create
    current_season = Season.find(params[:season_id])
    current_team = Team.find(params[:team_id])
    draft = Draft.new(draft_params)
    draft.save!
    redirect_to season_team_path(current_season, current_team)
  end

  private

  def draft_params
    params.require(:draft).permit(:amount, :player_id, :team_id)
  end
end
