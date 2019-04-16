	class Player


		#les variables d'instances sont en lecture et écriture
		attr_accessor :name	
		attr_accessor :life_points

		def initialize(name_to_save)
			@name = name_to_save
			@life_points = 10
		end


		def show_state 	
			puts "#{@name} a #{@life_points} points de vie"


		end


		def gets_damage(dommages,player2)

			player2.life_points = player2.life_points - dommages
			if player2.life_points <= 0
				puts "le joueur #{player2.name} a été tué !"
			end
		end

		def attacks(player2)
			
			puts "#{@name} attaque le joueur #{player2.name}"
			dommage_point = compute_damage
			puts "Il lui inflige #{dommage_point} points de dommages."
			
			gets_damage(dommage_point,player2)
		end

		def compute_damage
			return rand (1..6) 
		end

	end

