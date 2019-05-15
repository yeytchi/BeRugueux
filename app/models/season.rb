class Season < ApplicationRecord
  belongs_to :user
  has_many :teams

  validates :name, presence: true
  validates :number_of_teams, presence: true, inclusion: { in: [2, 4, 6] }

  enum status: { joining: 0, complete: 1 }

  after_create :set_calendar

  private
  def set_calendar
    order = (1..number_of_teams).to_a.shuffle

    calendar = {
      day_one: {
        game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[1]) },
        game_two: { home_team: teams.find(order[2]), away_team: teams.find(order[3]) },
        game_three: { home_team: teams.find(order[4]), away_team: teams.find(order[5]) },
      },
      day_two: {
        game_one: { home_team: teams.find(order[2]), away_team: teams.find(order[0]) },
        game_two: { home_team: teams.find(order[5]), away_team: teams.find(order[2]) },
        game_three: { home_team: teams.find(order[3]), away_team: teams.find(order[4]) },
      },
      day_three: {
        game_one: { home_team: teams.find(order[0]), away_team: teams.find(order[3]) },
        game_two: { home_team: teams.find(order[2]), away_team: teams.find(order[]) },
        game_three: { home_team: teams.find(order[3]), away_team: teams.find(order[4]) },
      }

    }


  end
end
