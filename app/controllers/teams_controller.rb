class TeamsController < ApplicationController
  before_action :set_budget, only: [:show]
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

    @selections = Selection.where(team: @team)

    @offers = Offer.where(team: @team)
  end

  private

  def set_budget
    @team = Team.find(params[:id])
    offers_amount = 0
    selections_amount = 0
    @team.offers.each do |offer|
      offers_amount += offer.amount
    end
    @team.selections.each do |selection|
      selections_amount += selection.amount
    end
    @team.budget = 1000 - (offers_amount + selections_amount)
    @team.save
  end

  def team_params
    params.require(:team).permit(:name, :logo, :main_colour, :secondary_colour)
  end
end









