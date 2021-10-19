require 'byebug'
require 'rubocop'

class Game
  attr_accessor :human_player, :enemies_array
  def initialize(name_of_the_player)
    @@enemies_array=[]
    @player0 = HumanPlayer.new(name_of_the_player)

    @player1 = Player.new("Jean")
    @@enemies_array << @player1

    @player2 = Player.new("Charlette")
    @@enemies_array << @player2

    @player3 = Player.new("Michel")
    @@enemies_array << @player3

    @player4 = Player.new("Germanine")
    @@enemies_array << @player4
  end

  def kill_player (player)
    @@enemies_array.delete(player)
    return @@enemies_array
  end

  def is_still_ongoing?

    if @player0.player_life_points > 0 && @@enemies_array.compact.size > 0 
      return true
    else
      return false
    end
  end

  def show_players 
    @player0.player_show_state
    @@enemies_array.each { |player| player.player_show_state}

  end


  def menu
    puts "ROUND X ------------------------------------------"
    puts
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "Attaquer un joueur en vue :"
    @@enemies_array.each_with_index { |player,index| puts "#{index+1} - #{player.player_name} (#{player.player_life_points} points de vie)"}
  end

  def menu_choice
    user_choice = gets.chomp
    case user_choice
    when "a" 
      @player0.search_weapon
    when "s"
      @player0.search_health_pack
    else
      case user_choice.to_i
      when (1..@@enemies_array.size+1)
        @player0.attacks(@@enemies_array[user_choice.to_i-1])
        if @@enemies_array[user_choice.to_i-1].player_life_points<1 then kill_player(@@enemies_array[user_choice.to_i-1]) end
      else
        puts "echec"
      end
    end
  end 

  def enemies_attack
    #c'est la riposte
   @@enemies_array.each { |player|  player.attacks(@player0)}
   puts
  end


  def end
    if @player0.player_life_points > 0 then puts "Bravo tu as gagné !!" else puts "Tu es éliminé !!!" end
  end
end
