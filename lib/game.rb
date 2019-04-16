class Game


	#les variables d'instances sont en lecture et écriture
	attr_accessor :human_player	
	attr_accessor :enemies


#initialisation des ennemies


	def initialize(game_name_to_save)
		@enemies = []
		@game_name = game_name_to_save
		enemies1 = Player.new("Josiane")
		enemies2 = Player.new("José")
		enemies3 = Player.new("Jean-Jacques")
		enemies4 = Player.new("Monique")
		@enemies << enemies1
		@enemies << enemies2
		@enemies << enemies3
		@enemies << enemies4
		@user1 = HumanPlayer.new(game_name_to_save)

			@life_points = 10
	end

	def kill_player(player_a_supp)
		
		@enemies.delete(player_a_supp)

	end

	def is_still_ongoing?
		if @user1.life_points >0 && enemies.length >0 then
			return true
		else
			return false
		end
	end


	def show_players
		puts @user1.show_state
		nb = @enemies.length
		puts "Il reste #{nb} bots en jeu"
	end

	def menu
		puts ""
		puts "___________________________________________"
		puts ""
		puts "Voici ton état : "
		puts @user1.show_state
		puts "___________________________________________"
		puts "Quelle action veux-tu effectuer ?"
		puts ""
		puts " Tapes a : pour chercher une meilleure arme"
		puts " Tapes s : pour chercher à te soigner"
		puts ""
		puts " Tu veux attaquer un joueur en vue :"
		puts ""
		i=0
		@enemies.each do |enemi_a_afficher|
		print "   Tapes #{i} : "
		puts enemi_a_afficher.show_state
		i = i + 1
		end
		puts ""
		print "tapes ton choix >"
		choix = gets.chomp
		return choix

	end


	def menu_choice (choix_menu)

		case choix_menu
			when "a"
				@user1.search_weapon
			when "s"
				@user1.search_health_pack
			else
				choix_menu= choix_menu.to_i
				puts ""
				puts "A l'attaque !"
				@user1.attacks(enemies[choix_menu])

				if enemies[choix_menu].life_points <= 0 then
					kill_player(enemies[choix_menu])
				end
			
			end
				puts "Les autres joueurs t'attaquent ! "
					@enemies.each do |enemie|

							enemie.attacks(@user1)
					end

	end

	def enemies_attack
		@enemies.each do |enemi_qui_attaque|
		enemi_qui_attaque.attacks(user1)

		end

	end

	def end
		if user1.life_points>0 then
			puts "BRAVO !!!! TU AS GAGNE !"
		else
			puts "BOUUUUUUU! TU AS PERDU !"
		end
	end

end
