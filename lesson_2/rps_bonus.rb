require 'pry'
class Player
  attr_accessor :move, :name, :score, :history
  def initialize
    @history = []
    @score = 0
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
    self.history << self.move.value
  end
end

class Computer < Player
  def set_name
    self.name = "Roy"
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.history << self.move.value
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
      other_move.value == 'scissors'
    when 'paper'
      other_move.value == 'rock'
    when 'scissors'
      other_move.value == 'paper'
    end
  end

  def <(other_move)
    case @value
    when 'rock'
      other_move.value == 'paper'
    when 'paper'
      other_move.value == 'scissors'
    when 'scissors'
      other_move.value == 'rock'
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
    binding.pry
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}"
    puts "#{computer.name} chose #{computer.move.value}"
  end

  def display_winner
    if human.move > computer.move
      human.score += 1
      puts "#{human.name} won that round!"
    elsif human.move < computer.move
      computer.score += 1
      puts "#{computer.name} won that round!!"
    else
      puts "It's a tie"
    end
    puts "Score is #{human.name}: #{human.score}" + " #{computer.name}: #{computer.score}"
    check_score
  end
  
  def display_history
    puts "#{computer.name} move list is #{computer.history}"
    puts "#{human.name} move list is #{human.history}"
  end

  def check_score
    if human.score == 10
      puts "#{human.name} wins with #{human.score} points!"
      reset_score
    elsif computer.score == 10
      puts "#{computer.name} wins with #{computer.score} points!"
      reset_score
    else
      return
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play_again?
    display_history
    answer = ''
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end
    ['y','Y'].include?(answer)
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
