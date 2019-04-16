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

my_game = Game.new("#{prenom}")


	while my_game.is_still_ongoing? == true


		my_game.menu_choice(my_game.menu)
	end

