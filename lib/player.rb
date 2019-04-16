	class Player < Game


		#les variables d'instances sont en lecture et écriture
		attr_accessor :name	
		attr_accessor :life_points

		#on lance initialisation du player
		def initialize(name_to_save)
			@name = name_to_save
			@life_points = 10
		end


		#méthode pour afficher l'état du joueur (en vie ou mort)
		def show_state 	
			if @life_points>0 then
			puts "#{@name} a #{@life_points} points de vie"
			else
			puts "#{@name} est mort(e)"
			
			end


		end


		#methode pour les dommages à tel joueur fait lors de l'attaque
		def gets_damage(dommages,player2)

			player2.life_points = player2.life_points - dommages
			#on vérifie qu'après les dommages, le joueur est toujours en vie 
			if player2.life_points <= 0
				puts "le joueur #{player2.name} a été tué !"
			end
		end

		#méthode qui gère les attaques 
		#et fait appel à deux autres méthodes :
		#         - méthode compute_damage pour savoir le nombre de dommage
		#         - méthode gets_damage pour calculer les dommages faits au joueur en question lors de l'attaque
		def attacks(player2)
			
			puts "     le joueur #{@name} attaque le joueur #{player2.name}"
			dommage_point = compute_damage
			puts "         => Il lui inflige #{dommage_point} points de dommages."
			
			gets_damage(dommage_point,player2)
		end

		#méthode du calcul des dommmages par lancement de dé de 1 à 6
		def compute_damage
			return rand (1..6) 
		end



	end

	#on fait une classe HumanPlayer 
	#on devrait la mettre dans un autre fichier mais pour cette fois
	#on nous demande de le même fichier
	#attention class dépendante de Player car on ajoute un weapon à ce type de joueur 
	class HumanPlayer < Player
		attr_accessor :weapon_level
		weapon_level=0

		def initialize(name_to_save)
			@weapon_level = 1
			@name = name_to_save
			@life_points = 100

		end

		#méthode pour afficher l'état du joueur et son niveau d'arme		
		def show_state 	
			puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
		end


		#méthode du calcul des dommmages par lancement de dé de 1 à 6 multiplié par le niveau de l'arme qu'à le joueur
		def compute_damage
			damage = rand (1..6) 
			damage = damage * @weapon_level
			return damage
		end


		#méthode pour la recherche d'arme
		def search_weapon 
			dé = rand (1..6)

			puts "Tu as trouvé une arme de niveau #{dé}"
			#si la nouvelle arme est supérieure à l'ancienne, on garde la nouvelle arme
				if dé > @weapon_level then
					@weapon_level = dé
					puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
					else
					puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."		
				end

		end

		#méthode pour la recherche de pack de point de vie

		def search_health_pack
			dé2 = rand (1..6)
				#en fonction du résultat aléatoir style dé, il y 50, 80 ou aucun points de vie
				case dé2 
					when 1 
					puts "Tu n'as rien trouvé"
					when 2..5
						@life_points = @life_points + 50
						if @life_points>100 then
							@life_points=100
						end
						puts "Bravo, tu as trouvé un pack de +50 points de vie !"
					when 6
						@life_points = @life_points + 80
						if @life_points>100 then
							@life_points=100
						end
						puts "Waow, tu as trouvé un pack de +80 points de vie !"
				end
			puts "Ton niveau de vie est à #{@life_points}"
	
		end


	end
