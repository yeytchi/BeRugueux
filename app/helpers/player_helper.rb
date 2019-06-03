module PlayerHelper
  # <%= player_availability(player, team) %>
  def player_availability(player, team)
    current_season = team.season
    player_selection_in_current_season = current_season.selections.where(player: player)
    player_selections_by_current_team = Selection.where(team: team, player: player)
    player_offers_by_current_team = Offer.where(team: team, player: player)

    if player_selection_in_current_season.empty? && player_offers_by_current_team.empty?
      return 'available'
    elsif player_selection_in_current_season.empty? && player_offers_by_current_team.any?
      return 'pending'
    elsif player_selection_in_current_season.any? && player_selections_by_current_team.empty?
      return 'unavailable'
    elsif player_selections_by_current_team.any?
      return 'owned'
    end
  end


  def player_current_season_team(season, player)
    season.selections.where(player: player).first.team
  end

end
