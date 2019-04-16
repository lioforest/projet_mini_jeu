require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#on déclare les joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

	#la partie continue jusqu'à un des deux joueurs n'est plus de vie
	while player1.life_points>0 || player2.life_points>0 

	
		puts "---------------------------------------"
		puts "Voici l'état des joueurs : "
		puts ""
		puts player1.show_state
		puts player2.show_state
		puts "=>>> Passons à la phase d'attaque !!!"
		puts ""

		#le jour 1 lance l'attaque de le joueur 2
		player1.attacks(player2)
		#on vérifie si le joueur 2 a toujours des points de vie
		#sinon on sort de la boucle
			if player2.life_points<= 0 then
				break

			end

		player2.attacks(player1)
		#on vérifie si le joueur 1 a toujours des points de vie
		#sinon on sort de la boucle
			if player1.life_points<= 0  then
				break

			end
		puts ""
		puts ""

	end


