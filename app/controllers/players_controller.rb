class PlayersController < ApplicationController

  def index
    @players = Player.all
    @user = current_user
    @season = Season.find(params[:season_id])
    @team = Team.find(params[:team_id])

    @draft = Draft.new(team: @team)

  end
end
