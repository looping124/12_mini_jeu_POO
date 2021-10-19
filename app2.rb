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
system ('clear')
player0 = HumanPlayer.new(humain_name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "#{player0.player_name}, vous allez affronter #{player1.player_name} et #{player2.player_name}"
