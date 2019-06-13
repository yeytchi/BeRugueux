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
Position.destroy_all
Player.destroy_all
PlayersPosition.destroy_all

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

puts 'Seeding Positions'
pilier_gauche = Position.create!(name: 'Pilier Gauche')
talonneur = Position.create!(name: 'Talonneur')
pilier_droit = Position.create!(name: 'Pilier Droit')
deuxieme_ligne = Position.create!(name: 'Deuxième Ligne')
troisieme_ligne_aile = Position.create!(name: 'Troisième Ligne Aile')
troisieme_ligne_centre = Position.create!(name: 'Troisième Ligne Centre')
demi_de_melee = Position.create!(name: 'Demi de Mélée')
demi_d_ouverture = Position.create!(name: "Demi d'Ouverture")
centre = Position.create!(name: 'Trois Quart Centre')
ailier = Position.create!(name: 'Trois Quart Aile')
arriere = Position.create!(name: 'Arrière')

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

puts 'Seeding Players Positions'
# Avants
clement_orne_position_one = PlayersPosition.create!(player: clement_orne, position: pilier_gauche)
clement_orne_position_two = PlayersPosition.create!(player: clement_orne, position: talonneur)
clement_orne_position_three = PlayersPosition.create!(player: clement_orne, position: pilier_droit)
corentin_aminot_position_one = PlayersPosition.create!(player: corentin_aminot, position: pilier_gauche)
corentin_aminot_position_three = PlayersPosition.create!(player: corentin_aminot, position: pilier_droit)
rhiad_dhari_position_one = PlayersPosition.create!(player: rhiad_dhari, position: pilier_gauche)
rhiad_dhari_position_three = PlayersPosition.create!(player: rhiad_dhari, position: pilier_droit)
jose_novak_position_one = PlayersPosition.create!(player: jose_novak, position: pilier_gauche)
jose_novak_position_three = PlayersPosition.create!(player: jose_novak, position: pilier_droit)
matthias_pukrop_position_one = PlayersPosition.create!(player: matthias_pukrop, position: pilier_gauche)
matthias_pukrop_position_three = PlayersPosition.create!(player: matthias_pukrop, position: pilier_droit)
bixente_maggie_position_two = PlayersPosition.create!(player: bixente_maggie, position: talonneur)
christopher_huyge_position_two = PlayersPosition.create!(player: christopher_huyge, position: talonneur)
clement_astier_position_one = PlayersPosition.create!(player: clement_astier, position: pilier_gauche)
clement_astier_position_three = PlayersPosition.create!(player: clement_astier, position: pilier_droit)
clement_astier_position_four = PlayersPosition.create!(player: clement_astier, position: deuxieme_ligne)
louis_porterie_position = PlayersPosition.create!(player: louis_porterie, position: deuxieme_ligne)
remy_albinet_position = PlayersPosition.create!(player: remy_albinet, position: deuxieme_ligne)
jules_castinel_position = PlayersPosition.create!(player: jules_castinel, position: deuxieme_ligne)
kevin_lafforgue_position_four = PlayersPosition.create!(player: kevin_lafforgue, position: deuxieme_ligne)
kevin_lafforgue_position_six = PlayersPosition.create!(player: kevin_lafforgue, position: troisieme_ligne_aile)
kevin_lafforgue_position_eight = PlayersPosition.create!(player: kevin_lafforgue, position: troisieme_ligne_centre)
lucas_bonnel_position_four = PlayersPosition.create!(player: lucas_bonnel, position: deuxieme_ligne)
lucas_bonnel_position_eight = PlayersPosition.create!(player: lucas_bonnel, position: troisieme_ligne_centre)
arnaud_alibert_position = PlayersPosition.create!(player: arnaud_alibert, position: troisieme_ligne_aile)
jonathan_lhopital_position_four = PlayersPosition.create!(player: jonathan_lhopital, position: deuxieme_ligne)
jonathan_lhopital_position_eight = PlayersPosition.create!(player: jonathan_lhopital, position: troisieme_ligne_centre)
florian_bernet_position = PlayersPosition.create!(player: florian_bernet, position: troisieme_ligne_aile)
nicolas_beaudouin_position_six = PlayersPosition.create!(player: nicolas_beaudouin, position: troisieme_ligne_aile)
nicolas_beaudouin_position_eight = PlayersPosition.create!(player: nicolas_beaudouin, position: troisieme_ligne_centre)

# Demis
maxime_brisseau_position = PlayersPosition.create!(player: maxime_brisseau, position: demi_de_melee)
alexis_edolphi_position = PlayersPosition.create!(player: alexis_edolphi, position: demi_de_melee)
pierre_dandrea_position_ten = PlayersPosition.create!(player: pierre_dandrea, position: demi_d_ouverture)
pierre_dandrea_position_twelve = PlayersPosition.create!(player: pierre_dandrea, position: centre)
pierre_dandrea_position_fifteen = PlayersPosition.create!(player: pierre_dandrea, position: arriere)
maximilien_pons_position_ten = PlayersPosition.create!(player: maximilien_pons, position: demi_d_ouverture)
maximilien_pons_position_twelve = PlayersPosition.create!(player: maximilien_pons, position: centre)
maximilien_pons_position_fifteen = PlayersPosition.create!(player: maximilien_pons, position: arriere)
sebastien_vedrenne_position_ten = PlayersPosition.create!(player: sebastien_vedrenne, position: demi_d_ouverture)
sebastien_vedrenne_position_twelve = PlayersPosition.create!(player: sebastien_vedrenne, position: centre)

# Trois Quarts
anthony_lasserre_position = PlayersPosition.create!(player: anthony_lasserre, position: centre)
alexis_conangle_position = PlayersPosition.create!(player: alexis_conangle, position: centre)
florent_bargozza_position = PlayersPosition.create!(player: florent_bargozza, position: centre)
enzo_garnaud_position = PlayersPosition.create!(player: enzo_garnaud, position: ailier)
valentin_mathieu_position_twelve = PlayersPosition.create!(player: valentin_mathieu, position: centre)
valentin_mathieu_position_fourteen = PlayersPosition.create!(player: valentin_mathieu, position: ailier)
antoine_gardeil_position_fourteen = PlayersPosition.create!(player: antoine_gardeil, position: ailier)
antoine_gardeil_position_fifteen = PlayersPosition.create!(player: antoine_gardeil, position: arriere)
jb_bataille_position_twelve = PlayersPosition.create!(player: jb_bataille, position: centre)
jb_bataille_position_fifteen = PlayersPosition.create!(player: jb_bataille, position: arriere)


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













