# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Starting seed'

admin = User.create!(username: 'Admin', email: 'admin@be-rugueux', password: 'adminpassword', admin: true)

nico = User.create!(username: 'La Beaude', email: 'nico@beaud.com', password: 'nicopassword')
chatte = User.create!(username: 'Chaton', email: 'benoit@calin.com', password: 'chattepassword')
lagrande = User.create!(username: 'Lagrande', email: 'kegin@lagranderie.com', password: 'lagrandepassword')
ens = User.create!(username: 'Ensbiker', email: 'kevin@enselme.com', password: 'enspassword')

complete_season = Season.create!(user: nico, name: 'Tournoi Boudins Caillettes', number_of_teams: 4)
incomplete_season = Season.create!(user: nico, name: 'Poule Oppo', number_of_teams: 4)

puts 'Seed completed'
