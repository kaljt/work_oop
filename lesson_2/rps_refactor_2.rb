class Player
  attr_accessor :move, :name
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a name"
    end
    self.name = n
  end

  def choose
    choice = ''
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = "Roy"
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    case value
    when 'rock'
      return true if other_move.value == 'scissors'
      return false
    when 'paper'
      return true if other_move.value == 'rock'
      return false
    when 'scissors'
      return true if other_move.value == 'paper'
      return false
    end
  end
  
  def <(other_move)
    case @value
    when 'rock'
      return true if other_move.value == 'paper'
      return false
    when 'paper'
      return true if other_move.value == 'scissors'
      return false
    when 'scissors'
      return true if other_move.value == 'rock'
      return false
    end
  end
  
end

class Rule
  
end

class RPSGame
  attr_reader :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end
  
  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end
  
  def display_winner
    puts "#{human.name} chose #{human.move.value}" 
    puts "#{computer.name} chose #{computer.move.value}"
    
    if human.move > computer.move
      puts "#{human.name} won!"
      elsif human.move < computer.move
        puts "#{computer.name} won!"
      else
        puts "It's a tie"
    end
  end
  
  def play_again?
    answer = ''
    loop do 
    puts "Would you like to play again (y/n)?"
    answer = gets.chomp
    break if ['y', 'n'].include? answer.downcase
    puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false
  end
  
  def play
    display_welcome_message
    loop do 
    human.choose
    computer.choose
    display_winner
    break unless play_again?
    end
    display_goodbye_message
  end
  
end

RPSGame.new.play
