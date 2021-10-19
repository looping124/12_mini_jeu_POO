require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

# partie = Game.new("Wolverine")
# # puts partie.is_still_ongoing?
# partie.show_players
# partie.menu
# partie.menu_choice
# partie.enemies_attack
# partie.show_players

system ('clear')
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Création d'un joueur humain, quel est votre nom ?"
humain_name = gets.chomp
partie = Game.new(humain_name)
puts "#{humain_name}, vous allez affronter de valeureux adversaires : "




round = 0
while partie.is_still_ongoing?
   round +=1
   puts
   puts "ROUND #{round} ------------------------------------------"
   puts
   partie.menu
   partie.menu_choice
   partie.enemies_attack
end
partie.end
#   puts "Quelle action veux-tu effectuer ?"
#   puts
#   puts "a - chercher une meilleure arme"
#   puts "s - chercher à se soigner "
#   puts
#   puts "attaquer un joueur en vue :"
#   if player1.player_life_points > 0
#       puts "0 - Josiane a #{player1.player_life_points} points de vie"
#     else
#       puts "X - Josiane est éliminée"
#     end 
#     if player2.player_life_points > 0
#       puts "1 - Josiane a #{player2.player_life_points} points de vie"
#     else
#       puts "X - Josiane est éliminée"
#   end 
#   puts
#   user_choice = gets.chomp
#   system("clear")
#   case user_choice
#     when "a" 
#        player0.search_weapon
#     when "s" 
#       player0.search_health_pack
#     when "0"
#       player0.attacks(player1)
     
#     when "1" 
#       player0.attacks(player2)
     
#     else 
#   end
#   puts
#   #au tour des adversaires, seulement si ils sont en vie

#   puts
#   #chaque adversaire attaque, uniquement s'il est vivant (points de vie > 0)
#   enemies_array.each { |player| if player.player_life_points > 0 then player.attacks(player0) end}

# end
# #on affiche le vainqueur
# if player0.player_life_points > 0 then puts "Bravo tu as gagné !!" else puts "Tu es éliminé" end
# puts "-----------------"
# puts "partie terminée"
# puts "-----------------"