module SeasonHelper
  # def new_season_round(season)
  #   teams = season.teams
  #   players = season.players

  #   if teams.select { |team| team.round == season.round }.empty?
  #     players.each do |player|
  #       keep_best_offer(player)
  #     end

  #     create_selections(players)

  #     season.round += 1
  #     season.save
  #   end
  # end

  # def keep_best_offer(player)
  #   best_offer = player.offers.max_by(1) { |offer| offer.amount }
  #   player.offers.each do |offer|
  #     offer.destroy unless offer == best_offer
  #   end
  # end

  # def create_selections(players)
  #   players.each do |player|
  #     Selection.create!(team: player.offers.first.team, player: player, offer: player.offers.first, amount: player.offers.first.amount)
  #   end
  # end
end
