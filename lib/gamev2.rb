class Game


	#les variables d'instances sont en lecture et écriture
	attr_accessor :human_player	
	attr_accessor :enemies


#initialisation des ennemies


	def initialize(game_name_to_save)
		@enemies_in_sight = []

		@game_name = game_name_to_save
		enemies1 = Player.new("Josiane")
		enemies2 = Player.new("José")
		enemies3 = Player.new("Jean-Jacques")
		enemies4 = Player.new("Monique")
		@players_left = 10
#initialisation des ennemies
		@enemies_in_sight << enemies1
		@enemies_in_sight << enemies2
		@enemies_in_sight << enemies3
		@enemies_in_sight << enemies4

	#initialisation du joueur 
		@user1 = HumanPlayer.new(game_name_to_save)

			@life_points = 10

	end

	def new_players_in_sight

		if @players_left <= 0
				puts "Tous les joueurs sont déjà en vue"
			else

			dé3 = rand(1..6)
			case dé3
				when 1
					puts "Aucun ennemie arrive ... tu es content, chanceux !"
				when (2..6)
					nom_nouveau_enemie = "joueur_#{rand(1..500000)}"
					enemies_bonus = Player.new(nom_nouveau_enemie)
					@enemies_in_sight << enemies_bonus
					@players_left -=1
					puts "Un nouvel énemie arrive ! #{nom_nouveau_enemie} est dans la place !"
				else 
					0.upto(2)
						nom_nouveau_enemie = "joueur_#{rand(1..500000)}"
						enemies_bonus = Player.new(nom_nouveau_enemie)
						@enemies_in_sight << enemies_bonus
						puts "Un nouvel énemie arrive ! #{nom_nouveau_enemie} est dans la place !"				
					end	
				end

							
		end

	#méthode pour supprimer de l'array(liste) des ennemies, les ennemies qui n'ont plus de vie

	def kill_player(player_a_supp)
		
		@enemies_in_sight.delete(player_a_supp)

	end

	#méthode vérifié si la partie peut continuer avec la condition
	#le user1 a toujours des points de vie et il y a encore au moins un ennemi

	def is_still_ongoing?
		if @user1.life_points >0 && @players_left >0 then
			return true
		else
			return false
		end
	end

	#métode pour indiquer l'état du joueur 1 et le nombre d'ennemi restant

	def show_players
		puts @user1.show_state
		nb = @enemies_in_sight.length
		puts "Il reste #{nb} bots en jeu"
	end

	#méthode pour afficher le menu

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
		#on affiche dans le menu, tous les ennemis l'un après l'autre
			@enemies_in_sight.each do |enemi_a_afficher|
				print "   Tapes #{i} : "
				puts enemi_a_afficher.show_state
				i = i + 1
			end
		puts ""
		print "tapes ton choix >"
		choix = gets.chomp
		return choix

	end

	#methode pour lancer l'action en fonction du choix de l'utilisateur

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
				@user1.attacks(@enemies_in_sight[choix_menu])

				if @enemies_in_sight[choix_menu].life_points <= 0 then
					kill_player(@enemies_in_sight[choix_menu])
				end
			
			end
				puts "Les autres joueurs t'attaquent ! "
					@enemies_in_sight.each do |enemie|

							enemie.attacks(@user1)
					end

	end

	#méthode l'attaque du user par les ennemise

	def enemies_attack
		@enemies_in_sight.each do |enemi_qui_attaque|
		enemi_qui_attaque.attacks(user1)

		end

	end

	#methode pour la fin de la partie 

	def end
		if @user1.life_points>0 then
			puts "BRAVO !!!! TU AS GAGNE !"
		else
			puts "BOUUUUUUU! TU AS PERDU !"
		end
	end

end
