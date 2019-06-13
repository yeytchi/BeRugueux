class PlayersController < ApplicationController
  before_action :set_budget_index, only: [:index]

  def index
    if params[:search]
      keyword = params[:search].parameterize.upcase
      @players = Player.where('UPPER(first_name) LIKE ? OR UPPER(last_name) LIKE ? OR UPPER(club) LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
      #  Player.join(:positions).where('name LIKE ?', "%#{params[:search]}%")

    else
      @players = Player.all
    end
    @user = current_user
    @season = Season.find(params[:season_id])
    @team = Team.find(params[:team_id])

    # Player New Offer
    @new_offer = Offer.new(team: @team)

    # Player Edit Offer
  end

  private

  def set_budget_index
    @team = Team.find(params[:team_id])
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

  def coupon_params
    params.require(:player).permit(:search, :first_name)
  end
end
