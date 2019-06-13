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
    @season = Season.find(params[:season_id])
    @team = Team.find(params[:id])
    @selections = Selection.where(team: @team)
    @offers = Offer.where(team: @team)
  end

  def update
    @season = Season.find(params[:season_id])
    @team = Team.find(params[:id])

    @team.round = @season.round + 1
    @team.save
    new_season_round(@season) if @season.teams.select { |team| team.round == @season.round }.empty?
    redirect_to season_team_path(@season, @team)
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

  def new_team_round(team)
    team.round += 1
    team.save
  end

  def new_season_round(season)
    season_players = season.players.uniq
    season_offers = season.offers

    season_players.each do |player|
      create_selection(player, season_offers)
    end

    destroy_season_offers(season.teams)

    season.round += 1
    season.save
  end

  def create_selection(player, season_offers)
    player_offers = season_offers.select { |offer| offer.player == player }
    best_offer = player_offers.max_by { |offer| offer.amount }
    Selection.create!(team: best_offer.team, player: player, amount: best_offer.amount)
  end

  def destroy_season_offers(teams)
    teams.each do |team|
      Offer.where(team: team).destroy_all
    end
  end
end





