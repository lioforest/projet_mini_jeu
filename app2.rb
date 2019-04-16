require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "_____________________________________________"
puts "|                  BIENVENUE                |"
puts "|                                           |"
puts "|                   FORTPOO                 |"
puts "|                                           |"
puts "|  LE JEU QUI VA TE FAIRE OUBLIER FORTNITE  |"
puts "|                                           |"
puts "|  Un seul objectif : tuer tous les autres  |"
puts "|                                           |"
puts "|___________________________________________|"
    
puts "Entre ton prénom ou ton pseudo :"
print "> "
prenom = gets.chomp
user1 = HumanPlayer.new("#{prenom}")

#initialisation des ennemies
	array_enemies = []
	enemies1 = Player.new("Josiane")
	array_enemies << enemies1
	enemies2 = Player.new("José")
	array_enemies << enemies2

	while user1.life_points > 0 && (enemies1.life_points>0 || enemies2.life_points>0) 

		puts ""
		puts "___________________________________________"
		puts ""
		puts "Voici ton état : "
		puts user1.show_state
		puts "___________________________________________"
		puts "Quelle action veux-tu effectuer ?"
		puts ""
		puts " Tapes a : pour chercher une meilleure arme"
		puts " Tapes s : pour chercher à te soigner"
		puts ""
		puts " Tu veux attaquer un joueur en vue :"
		puts ""
		print "   Tapes 0 : "
		puts enemies1.show_state
		print "   Tapes 1 : "
		puts enemies2.show_state
		puts ""
		print "tapes ton choix >"

		choix = gets.chomp

		case choix
			when "a"
				user1.search_weapon
			when "s"
				user1.search_health_pack
			when "0"
				user1.attacks(enemies1)
			when "1"
				user1.attacks(enemies2)
			end
		puts "Les autres joueurs t'attaquent ! "
			array_enemies.each do |enemie|

				if enemie.life_points>0 then
					enemie.attacks(user1)
				end
			end

	end

	if user1.life_points>0 then
		puts "BRAVO !!!! TU AS GAGNE !"
	else
		puts "BOUUUUUUU! TU AS PERDU !"
	end
