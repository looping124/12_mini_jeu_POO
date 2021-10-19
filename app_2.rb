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
enemies_array =[]
humain_name = gets.chomp
system ('clear')
player0 = HumanPlayer.new(humain_name)
player1 = Player.new("Josiane")
enemies_array << player1
player2 = Player.new("José")
enemies_array << player2
puts "#{player0.player_name}, vous allez affronter #{player1.player_name} et #{player2.player_name}"


puts "Début du combat :"

round = 0
while player0.player_life_points > 0 && (player1.player_life_points > 0 || player2.player_life_points > 0)
  round +=1
  puts
  puts "ROUND #{round} ------------------------------------------"
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
  if player1.player_life_points > 0
      puts "0 - #{player1.player_name} a #{player1.player_life_points} points de vie"
    else
      puts "X - #{player1.player_name} est éliminée"
    end 
    if player2.player_life_points > 0
      puts "1 - #{player2.player_name} a #{player2.player_life_points} points de vie"
    else
      puts "X - #{player2.player_name} est éliminée"
  end 
  puts
  user_choice = gets.chomp
  system("clear")
  case user_choice
    when "a" 
       player0.search_weapon
    when "s" 
      player0.search_health_pack
    when "0"
      player0.attacks(player1)
     
    when "1" 
      player0.attacks(player2)
     
    else 
  end
  puts
  #au tour des adversaires, seulement si ils sont en vie
  sum_enemies_life_points =0
  #on somme les points de vie adverse
  enemies_array.each {|player| sum_enemies_life_points =+ player.player_life_points}
  #si le resultat est plus grand que 0 alors c'est que au moins 1 adversaire est vivant
  if sum_enemies_life_points > 0 
    puts "Les autres joueurs t'attaquent !"
  end
  puts
  #chaque adversaire attaque, uniquement s'il est vivant (points de vie > 0)
  enemies_array.each { |player| if player.player_life_points > 0 then player.attacks(player0) end}

end
#on affiche le vainqueur
if player0.player_life_points > 0 then puts "Bravo tu as gagné !!" else puts "Tu es éliminé" end
puts "-----------------"
puts "partie terminée"
puts "-----------------"