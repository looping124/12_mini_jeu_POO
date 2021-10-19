require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = HumanPlayer.new("SUPER HUMAIN PLAYER")
player2 = Player.new("José")


puts "Début du combat :"
puts
round = 0
while player1.player_life_points > 0 && player2.player_life_points > 0
  round +=1
  player1.player_show_state
  player2.player_show_state
  puts
  puts "ROUND #{round} ------------------------------------------"
  puts
  player1.search_weapon
  player1.search_health_pack 
  player1.attacks(player2)
  puts
  if player2.player_life_points > 0
    player2.attacks(player1)
    puts
  end
end

puts "Fin du combat"
