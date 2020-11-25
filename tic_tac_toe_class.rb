class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end 

  def player_turn 
    puts "#{self.name} take your turn"
    puts 'Which block number would you like?'
    $turn = gets.chomp.to_i
    if $board_position[$turn].length > 1
       puts 'That space is already allocated, pick another'
       player_turn
    else $board_position[$turn] << "#{self.color}"
    end
  end

  def win 
    if $board_position[0..2].join("") == "#{self.color}" + "#{self.color}" + "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[3..5].join("") == "#{self.color}" + "#{self.color}" + "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[6..8].join("") == "#{self.color}" + "#{self.color}" + "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[0] == "#{self.color}" &&  $board_position[3] == "#{self.color}" &&
      $board_position[6] == "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[1] == "#{self.color}" && $board_position[4] == "#{self.color}" &&
       $board_position[7] == "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[2] == "#{self.color}" && $board_position[5] == "#{self.color}" &&
      $board_position[8]== "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[2] == "#{self.color}" && $board_position[4] =="#{self.color}" && 
      $board_position[6] == "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    elsif $board_position[0] == "#{self.color}" && $board_position[4] == "#{self.color}" &&
       $board_position[8] == "#{self.color}"
      puts "Congratualtions #{self.name} You win"
    else puts "DRAW!"
    end
  end

end

class Board 
  attr_accessor :board_position

  def initialize
    $board_position = board_position
    $board_position = [["0"], ["1"], ["2"], ["3"], ["4"], ["5"], ["6"], ["7"], ["8"], ["9"]]
  end

  def show_board
    puts ""
    puts "***************"
    puts "*_Tic_Tac_Toe_*"
    puts "*_____________*"
    puts "*|_#{$board_position[1][-1]}_|_#{$board_position[2][-1]}_|_#{$board_position[3][-1]}_|*"
    puts "*|_#{$board_position[4][-1]}_|_#{$board_position[5][-1]}_|_#{$board_position[6][-1]}_|*"
    puts "*|_#{$board_position[7][-1]}_|_#{$board_position[8][-1]}_|_#{$board_position[9][-1]}_|*"
    puts "***************"
    puts "***************"
  end
end

class Game

  def initialize
    @players = []
  end

  def coin_toss
    if rand(2) + 1 == 1
      @players.reverse!
      puts "Tails, #{@players[0].name} goes first"
    else 
      puts "Heads, #{@players[0].name} goes first"
    end
  end

  def round
    until $board_position.flatten.length > 18
      @players.each { |a| a.player_turn; @@board.show_board }
    end
  end

  def check_winner
    $board_position.each {|a| a.shift}
    $board_position.flatten!
    $board_position.shift
    @players.each {|a| a.win}
  end

  def play
    puts 'Hi there.'
    puts "Welcome to Tic Tac Toe"
    puts "The object of the game is three in a row"
    puts " XXX or 000 wins the game, horizontally, vertically or diagonally"
    puts "Player X enter your name"
    player_X = Player.new(gets.chomp, 'X')
    @players << player_X
    puts "Player 0 enter your name"
    player_0 = Player.new(gets.chomp, '0')
    @players << player_0
    puts "Let's toss a coin to see who goes first"
    puts "Heads, #{player_X.name} goes first, tails it's #{player_0.name}." 
    coin_toss
    @@turn_count = 0
    @@board = Board.new
    @@board.show_board
    round
    check_winner
  end

end

@tic = Game.new.play