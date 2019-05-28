class TeamsController < ApplicationController

  def new
    @season = Season.find(params[:season_id])
    @team = Team.new
  end

  def create
    @season = Season.find(params[:season_id])
    @team = Team.new(team_params)
    @team.user = current_user
    @team.season = @season

    if @team.save
      redirect_to season_path(@season)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    @season = Season.find(params[:season_id])

    @players = Player.where(user: current_user)

    @offers = Offer.where(team: @team)
  end

  private
  def team_params
    params.require(:team).permit(:name, :logo, :main_colour, :secondary_colour)
  end

end
