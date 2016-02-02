class RockPaperScissors
  def initialize(name)
    @player = Player.new(name)
  end
  #player_turn
  #computer_turn
  #compare_hands and determine winner
  #start_again
  
  
  
  
  
end

class Player
  attr_reader :player_name
  def initialize(player_name = '')
    @player_name = player_name
  end
  
end

puts "Starting game... Enter Name:"
name = gets.chomp
game = RockPaperScissors.new(name)