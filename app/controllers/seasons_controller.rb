class SeasonsController < ApplicationController
  before_action :set_season, only: [:show]
  before_action :set_status, only: [:show]

  def index
    if current_user.admin?
      @seasons = Season.all
    else
      @seasons = Season.where(user_id: current_user)
    end
  end

  def new
    @season = Season.new
  end

  def create
    @season = current_user.seasons.new(event_params)

    if @season.save
      redirect_to @season
    else
      render :new
    end
  end

  def show
    @teams = Team.where(season_id: @season.id)
    # set_calendar
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end

  def set_status
    if @season.teams.count == @season.number_of_teams
      @season.status = :complete
    else
      @season.status = :joining
    end
  end

  # def set_calendar
  #   teams = Team.where(season_id: @season.id)
  #   order = (1..@season.number_of_teams).to_a.shuffle
  #   case @season.number_of_teams
  #   when 2
  #     @calendar = {
  #       day_one: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[1]) }
  #       }
  #     }
  #   when 4
  #     @calendar = {
  #       day_one: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[1]) },
  #         game_two: { home_team: teams.find(order[2]), away_team: teams.find(order[3]) }
  #       },
  #       day_two: {
  #         game_one: { home_team: teams.find(order[2]), away_team: teams.find(order[0]) },
  #         game_two: { home_team: teams.find(order[3]), away_team: teams.find(order[1]) }
  #       },
  #       day_three: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[3]) },
  #         game_two: { home_team: teams.find(order[2]), away_team: teams.find(order[1]) }
  #       }
  #     }
  #   when 6
  #     @calendar = {
  #       day_one: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[1]) },
  #         game_two: { home_team: teams.find(order[2]), away_team: teams.find(order[3]) },
  #         game_three: { home_team: teams.find(order[4]), away_team: teams.find(order[5]) }
  #       },
  #       day_two: {
  #         game_one: { home_team: teams.find(order[2]), away_team: teams.find(order[0]) },
  #         game_two: { home_team: teams.find(order[3]), away_team: teams.find(order[4]) },
  #         game_three: { home_team: teams.find(order[5]), away_team: teams.find(order[1]) }
  #       },
  #       day_three: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[3]) },
  #         game_two: { home_team: teams.find(order[4]), away_team: teams.find(order[1]) },
  #         game_three: { home_team: teams.find(order[5]), away_team: teams.find(order[2]) }
  #       },
  #       day_four: {
  #         game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[4]) },
  #         game_two: { home_team: teams.find(order[1]), away_team: teams.find(order[2]) },
  #         game_three: { home_team: teams.find(order[3]), away_team: teams.find(order[5]) }
  #       },
  #       day_five: {
  #         game_one: { home_team: teams.find(order[5]), away_team: teams.find(order[0]) },
  #         game_two: { home_team: teams.find(order[1]), away_team: teams.find(order[3]) },
  #         game_three: { home_team: teams.find(order[2]), away_team: teams.find(order[4]) }
  #       }
  #     }
  #   end
  #   @calendar
  # end

end
