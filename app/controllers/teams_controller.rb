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

    @team.round += 1
    @team.save
    new_season_round(@season)
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
    players = season.players
    if season.teams.select { |team| team.round == season.round }.empty?
      players.each do |player|
        keep_best_offer(player)
      end
      create_selections(players)
      destroy_remaining_offers(season.teams)

      season.round += 1
      season.save
    end
  end

  def keep_best_offer(player)
    best_offer = player.offers.max_by(1) { |offer| offer.amount }.first
    player.offers.each do |offer|
      offer.destroy unless offer == best_offer
    end
  end

  def create_selections(players)
    players.each do |player|
      best_offer = player.offers.first
      Selection.create!(team: best_offer.team, player: player, amount: best_offer.amount)
    end
  end

  def destroy_remaining_offers(teams)
    teams.each do |team|
      team.offers.each do |offer|
        offer.destroy
      end
    end
  end
end








