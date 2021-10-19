require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

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
   puts "ROUND #{round} ------------------------------------------"
   puts
   partie.menu
   
   partie.menu_choice
   system ('clear')
   partie.enemies_attack
end
partie.end
