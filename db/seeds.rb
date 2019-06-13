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
Player.destroy_all

puts 'Starting seed'
puts 'Seeding Users'
admin = User.create!(username: 'Admin', email: 'admin@be-rugueux', password: 'adminpassword', admin: true)

nico = User.create!(username: 'La Beaude', email: 'nico@beaud.com', password: 'nicopassword')
chatte = User.create!(username: 'Chaton', email: 'benoit@calin.com', password: 'chattepassword')
lagrande = User.create!(username: 'Lagrande', email: 'kevin@lagranderie.com', password: 'lagrandepassword')
ens = User.create!(username: 'Ensbiker', email: 'kevin@enselme.com', password: 'enspassword')
drij = User.create!(username: 'Drij', email: 'adrien@maire.com', password: 'drijpassword')

puts 'Seeding Seasons'
# Saisons nico
tournoi_bc = Season.create!(user: nico, name: 'Tournoi Boudins Caillettes', number_of_teams: 4, round: 2)
poule_oppo = Season.create!(user: nico, name: 'Poule Oppo', number_of_teams: 4)

# Saisons lagrande
lagrande_saison = Season.create!(user: lagrande, name: 'Lagrande Saison', number_of_teams: 2)

puts 'Seeding Teams'
# Tournoi Boudins Caillettes
olympique_saucisse = Team.create!(season: tournoi_bc, user: nico, name: 'Olympique Saucisse', main_colour: 'blue', secondary_colour: 'orange', round: 2)
rc_belote = Team.create!(season: tournoi_bc, user: chatte, name: 'RC Belote', main_colour: 'black', secondary_colour: 'white', round: 2)
ca_tango = Team.create!(season: tournoi_bc, user: lagrande, name: 'CA Tango', main_colour: 'green', secondary_colour: 'white', round: 2)
union_nazes = Team.create!(season: tournoi_bc, user: ens, name: 'Union Nazes', main_colour: 'red', secondary_colour: 'black', round: 2)
lagrande_equipe = Team.create!(season: lagrande_saison, user: lagrande, name: 'Lagrande Equipe', main_colour: 'green', secondary_colour: 'brown', round: 2)

puts 'Seeding Days'
# Tournoi Boudins Caillettes
tournoi_bc_day_one = Day.create!(season: tournoi_bc)
tournoi_bc_day_two = Day.create!(season: tournoi_bc)
tournoi_bc_day_three = Day.create!(season: tournoi_bc)

puts 'Seeding Games'
# Tournoi Boudins Caillettes
tournoi_bc_day_one_game_one = Game.create!(day: tournoi_bc_day_one, home_team: rc_belote, away_team: ca_tango)
tournoi_bc_day_one_game_two = Game.create!(day: tournoi_bc_day_one, home_team: olympique_saucisse, away_team: union_nazes)
tournoi_bc_day_two_game_one = Game.create!(day: tournoi_bc_day_two, home_team: olympique_saucisse, away_team: rc_belote)
tournoi_bc_day_two_game_two = Game.create!(day: tournoi_bc_day_two, home_team: union_nazes, away_team: ca_tango)
tournoi_bc_day_three_game_one = Game.create!(day: tournoi_bc_day_three, home_team: rc_belote, away_team: union_nazes)
tournoi_bc_day_three_game_two = Game.create!(day: tournoi_bc_day_three, home_team: olympique_saucisse, away_team: ca_tango)

puts 'Seeding Players'
# Avants
clement_orne = Player.create!(first_name: 'Clément', last_name: 'Orne', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 2 3')
corentin_aminot = Player.create!(first_name: 'Corentin', last_name: 'Aminot', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 3')
rhiad_dhari = Player.create!(first_name: 'Rhiad', last_name: 'Dhari', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 3')
jose_novak = Player.create!(first_name: 'José', last_name: 'Novak', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 3')
matthias_pukrop = Player.create!(first_name: 'Matthias', last_name: 'Pukrop', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 3')
bixente_maggie = Player.create!(first_name: 'Bixente', last_name: 'Maggie', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '2')
christopher_huyge = Player.create!(first_name: 'Christopher', last_name: 'Huyge', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '2')
clement_astier = Player.create!(first_name: 'Clément', last_name: 'Astier', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '1 3 4 5')
louis_porterie = Player.create!(first_name: 'Louis', last_name: 'Porterie', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5')
remy_albinet = Player.create!(first_name: 'Rémy', last_name: 'Albinet', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5')
jules_castinel = Player.create!(first_name: 'Jules', last_name: 'Castinel', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5')
kevin_lafforgue = Player.create!(first_name: 'Kevin', last_name: 'Lafforgue', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5 6 7 8')
lucas_bonnel = Player.create!(first_name: 'Lucas', last_name: 'Bonnel', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5 8')
arnaud_alibert = Player.create!(first_name: 'Arnaud', last_name: 'Alibert', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '6 7')
jonathan_lhopital = Player.create!(first_name: 'Jonathan', last_name: 'Lhopital', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '4 5 8')
florian_bernet = Player.create!(first_name: 'Florian', last_name: 'Bernet', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '6 7')
nicolas_beaudouin = Player.create!(first_name: 'Nicolas', last_name: 'Beaudouin', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '6 7 8')

# Demis
maxime_brisseau = Player.create!(first_name: 'Maxime', last_name: 'Brisseau', club: 'CA Lormont', kicker: true, kicking_accuracy: 70, position: '9')
alexis_edolphi = Player.create!(first_name: 'Alexis', last_name: 'Edolphi', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '9')
pierre_dandrea = Player.create!(first_name: 'Pierre', last_name: "D'Andrea", club: 'CA Lormont', kicker: true, kicking_accuracy: 80, position: '10 12 13 15')
maximilien_pons = Player.create!(first_name: 'Maximilien', last_name: 'Pons', club: 'CA Lormont', kicker: true, kicking_accuracy: 80, position: '10 12 13 15')
sebastien_vedrenne = Player.create!(first_name: 'Sebastien', last_name: 'Vedrenne', club: 'CA Lormont', kicker: true, kicking_accuracy: 80, position: '10 12 13')

# Trois Quarts
anthony_lasserre = Player.create!(first_name: 'Anthony', last_name: 'Lasserre', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '12 13')
alexis_conangle = Player.create!(first_name: 'Alexis', last_name: 'Conangle', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '12 13')
florent_bargozza = Player.create!(first_name: 'Florent', last_name: 'Bargozza', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '12 13')
enzo_garnaud = Player.create!(first_name: 'Enzo', last_name: 'Garnaud', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '11 14')
valentin_mathieu = Player.create!(first_name: 'Valentin', last_name: 'Mathieu', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '11 13 14')
antoine_gardeil = Player.create!(first_name: 'Antoine', last_name: 'Gardeil', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '11 14 15')
jb_bataille = Player.create!(first_name: 'Jean Baptiste', last_name: 'Bataille', club: 'CA Lormont', kicker: false, kicking_accuracy: 0, position: '12 13 15')

puts 'Seeding Offers'
# Offres Olympique Saucisse (La Beaud)
offre_olympique_saucisse_nicolas_beaudouin = Offer.create!(team: olympique_saucisse, player: nicolas_beaudouin, amount: 10)
offre_olympique_saucisse_maxime_brisseau = Offer.create!(team: olympique_saucisse, player: maxime_brisseau, amount: 10)
offre_olympique_saucisse_valentin_mathieu = Offer.create!(team: olympique_saucisse, player: valentin_mathieu, amount: 10)

# Offres RC Belote (Chatte)
offre_rc_belote_nicolas_beaudouin = Offer.create!(team: rc_belote, player: nicolas_beaudouin, amount: 20)
offre_rc_belote_arnaud_alibert = Offer.create!(team: rc_belote, player: arnaud_alibert, amount: 100)
offre_rc_belote_jules_castinel = Offer.create!(team: rc_belote, player: jules_castinel, amount: 25)
offre_rc_belote_sebastien_vedrenne = Offer.create!(team: olympique_saucisse, player: valentin_mathieu, amount: 10)

# Offres CA Tango(Lagrande)
offre_ca_tango_nicolas_beaudouin = Offer.create!(team: ca_tango, player: nicolas_beaudouin, amount: 100)
offre_ca_tango_rhiad_dhari = Offer.create!(team: ca_tango, player: rhiad_dhari, amount: 40)
offre_ca_tango_alexis_conangle = Offer.create!(team: ca_tango, player: valentin_mathieu, amount: 10)

# Offres Union Nazes (Ensbiker)
offre_union_nazes_jose_novak = Offer.create!(team: union_nazes, player: jose_novak, amount: 150)
offre_union_nazes_remy_albinet = Offer.create!(team: union_nazes, player: remy_albinet, amount: 70)
offre_union_nazes_anthony_lasserre = Offer.create!(team: union_nazes, player: anthony_lasserre, amount: 50)

puts 'Seeding Selections'
# Sélections Olympique Saucisse (La Beaud)
selection_olympique_saucisse_maxime_brisseau = Selection.create!(team: olympique_saucisse, player: maxime_brisseau, amount: offre_olympique_saucisse_maxime_brisseau.amount)
selection_olympique_saucisse_valentin_mathieu = Selection.create!(team: olympique_saucisse, player: valentin_mathieu, amount: offre_olympique_saucisse_valentin_mathieu.amount)

# Sélections RC Belote (Chatte)
selection_rc_belote_arnaud_alibert = Selection.create!(team: rc_belote, player: arnaud_alibert, amount: offre_rc_belote_arnaud_alibert.amount)
selection_rc_belote_jules_castinel = Selection.create!(team: rc_belote, player: jules_castinel, amount: offre_rc_belote_jules_castinel.amount)
selection_rc_belote_sebastien_vedrenne = Selection.create!(team: rc_belote, player: sebastien_vedrenne, amount: offre_rc_belote_sebastien_vedrenne.amount)

# Sélections CA Tango (Lagrande)
selection_ca_tango_nicolas_beaudouin = Selection.create!(team: ca_tango, player: nicolas_beaudouin, amount: offre_ca_tango_nicolas_beaudouin.amount)
selection_ca_tango_rhiad_dhari = Selection.create!(team: ca_tango, player: rhiad_dhari, amount: offre_ca_tango_rhiad_dhari.amount)
selection_ca_tango_alexis_conangle = Selection.create!(team: ca_tango, player: alexis_conangle, amount: offre_ca_tango_alexis_conangle.amount)

# Sélections Union Nazes (Ensbiker)
selection_union_nazes_jose_novak = Selection.create!(team: union_nazes, player: jose_novak, amount: offre_union_nazes_jose_novak.amount)
selection_union_nazes_remy_albinet = Selection.create!(team: union_nazes, player: remy_albinet, amount: offre_union_nazes_remy_albinet.amount)
selection_union_nazes_anthony_lasserre = Selection.create!(team: union_nazes, player: anthony_lasserre, amount: offre_union_nazes_anthony_lasserre.amount)

puts 'Seed completed'













