require 'byebug'
require 'rubocop'



class Player
  attr_accessor :player_name, :player_life_points

  def initialize(player_name)


      @player_name = player_name
      @player_life_points = 10
      puts "Joueur #{@player_name} créé avec #{@player_life_points} points de vie" 

    puts
  end

  def player_show_state #permet d'afficher un joueur, ses points de vie et s'il est vivant ou éliminé.
    if @player_life_points > 0
      puts "Le joueur #{@player_name} est en vie avec #{@player_life_points} points de vie."
      else
      puts "Le joueur #{@player_name} est éliminé."
    end
  end



  def gets_damage(damages=1) #inflige des dégats au joueur en question
    @damages=damages
    @player_life_points = @player_life_points - @damages
    puts "Le joueur #{@player_name} a pris #{@damages} points de dégats"
    player_show_state
    
  end

  def attacks (player_attacked) # le joueur appelé attaque le joueur en argument
    @damages = compute_damage
    puts "le joueur #{@player_name} attaque le joueur #{player_attacked.player_name} et lui inflige #{@damages} points de dégats"
    player_attacked.gets_damage(@damages)
  end


  def compute_damage # on calcul le nombre de points de vie retiré lors d'une attaque
    return rand(1..6)
  end



end

class HumanPlayer < Player
  attr_accessor :player_name
  def initialize(player_name )
    @player_name = player_name
    @player_life_points = 100
    @weapon_level = 1
    puts "Joueur #{@player_name} créé avec #{@player_life_points} points de vie" 
    puts "#{@player_name} est un HumanPlayer"

  puts
  end
  
  def search_weapon 
    new_weapon = rand(1..6)
    if new_weapon > @weapon_level
       @weapon_level = new_weapon
       puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack 
    new_health_pack  = rand(1..6)
    puts new_health_pack
    case new_health_pack
    when 1
      puts "Tu n'as rien trouvé... "
    when (2..5)
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @player_life_points += 50
      player_show_state
    when 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @player_life_points += 80
      player_show_state
    else
      puts "test echec"
    end
  end

end