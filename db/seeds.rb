# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Season.destroy_all
Team.destroy_all
Day.destroy_all
Game.destroy_all

puts 'Starting seed'
puts 'Seeding Users'
admin = User.create!(username: 'Admin', email: 'admin@be-rugueux', password: 'adminpassword', admin: true)

nico = User.create!(username: 'La Beaude', email: 'nico@beaud.com', password: 'nicopassword')
chatte = User.create!(username: 'Chaton', email: 'benoit@calin.com', password: 'chattepassword')
lagrande = User.create!(username: 'Lagrande', email: 'kegin@lagranderie.com', password: 'lagrandepassword')
ens = User.create!(username: 'Ensbiker', email: 'kevin@enselme.com', password: 'enspassword')

puts 'Seeding Seasons'
tournoi_bc = Season.create!(user: nico, name: 'Tournoi Boudins Caillettes', number_of_teams: 4)
poule_oppo = Season.create!(user: nico, name: 'Poule Oppo', number_of_teams: 4)

puts 'Seeding Teams'
olymplique_saucisse = Team.create!(season: tournoi_bc, user: nico, name: 'Olympique Saucisse', main_colour: 'blue', secondary_colour: 'orange')
rc_belote = Team.create!(season: tournoi_bc, user: chatte, name: 'RC Belote', main_colour: 'black', secondary_colour: 'white')
ca_tango = Team.create!(season: tournoi_bc, user: lagrande, name: 'CA Tango', main_colour: 'green', secondary_colour: 'white')
union_nazes = Team.create!(season: tournoi_bc, user: ens, name: 'Union Nazes', main_colour: 'red', secondary_colour: 'black')

puts 'Seeding Days'
tournoi_bc_day_one = Day.create(season: tournoi_bc)
tournoi_bc_day_two = Day.create(season: tournoi_bc)
tournoi_bc_day_three = Day.create(season: tournoi_bc)

puts 'Seeding Games'
tournoi_bc_day_one_game_one = Game.create(day: tournoi_bc_day_one, home_team: rc_belote, away_team: ca_tango)
tournoi_bc_day_one_game_two = Game.create(day: tournoi_bc_day_one, home_team: olymplique_saucisse, away_team: union_nazes)
tournoi_bc_day_two_game_one = Game.create(day: tournoi_bc_day_two, home_team: olymplique_saucisse, away_team: rc_belote)
tournoi_bc_day_two_game_two = Game.create(day: tournoi_bc_day_two, home_team: union_nazes, away_team: ca_tango)
tournoi_bc_day_three_game_one = Game.create(day: tournoi_bc_day_three, home_team: rc_belote, away_team: union_nazes)
tournoi_bc_day_three_game_two = Game.create(day: tournoi_bc_day_three, home_team: olymplique_saucisse, away_team: ca_tango)

puts 'Seed completed'
