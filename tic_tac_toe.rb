def game
  $turn_count = 0
  def game_check
      def draw #draw conditions
        if $turn_count = 9 && win == false
          return draw == true
        end
      end

    def win #win conditions
      if $board_numbers.values_at(0, 1, 2) == ("X") || $board_numbers.values_at(0, 1, 2) == ("0")
        return win == true
      elsif $board_numbers.values_at(0, 3, 6) == ("X") || $board_numbers.values_at(0, 3, 6) == ("0")
        return win == true
      elsif $board_numbers.values_at(0, 4, 8) == ("X") || $board_numbers.values_at(0, 4, 8) == ("0")
        return win == true
      elsif $board_numbers.values_at(1, 4, 7) == ("X") || $board_numbers.values_at(1, 4, 7) == ("0")
        return win == true
      elsif $board_numbers.values_at(2, 5, 8) == ("X") || $board_numbers.values_at(2, 5, 8) == ("0")
        return win == true
      elsif $board_numbers.values_at(3, 4, 5) == ("X") || $board_numbers.values_at(3, 4, 5) == ("0")
        return win == true
      elsif $board_numbers.values_at(6, 7, 8) == ("X") || $board_numbers.values_at(6, 7, 8) == ("0")
        return win == true
      elsif $board_numbers.values_at(2, 4, 6) == ("X") || $board_numbers.values_at(2, 4, 6) == ("0") 
        return win == true
      else return win == false
      end
    end
  
  end
    $board_numbers = [['0'], ['1'], ['2'], ['3'], ['4'], ['5'], ['6'], ['7'], ['8'], ['9']]
  def board #defines and updates the game board
    puts ""
    puts "***************"
    puts "*_Tic_Tac_Toe_*"
    puts "*_____________*"
    puts "*|_#{$board_numbers[1][-1]}_|_#{$board_numbers[2][-1]}_|_#{$board_numbers[3][-1]}_|*"
    puts "*|_#{$board_numbers[4][-1]}_|_#{$board_numbers[5][-1]}_|_#{$board_numbers[6][-1]}_|*"
    puts "*|_#{$board_numbers[5][-1]}_|_#{$board_numbers[8][-1]}_|_#{$board_numbers[9][-1]}_|*"
    puts "***************"
    puts "***************"    
  end

  def player_X_turn #player 1's turn
    puts "#{$player_X} take your turn"
    puts "Which block number would you like?"
    $turn = gets.chomp.to_i
    if $board_numbers[$turn][-1]!= "X" && $board_numbers[$turn][-1] != "0"
      $board_numbers[$turn] << "X"
      $turn_count += 1
      if $turn_count >= 9
        puts "GAME OVER!"
        board
        game.exit 
      else 
        board
        player_0_turn
        puts "#{$player_0} take your turn"
      end
    else  puts "That space is already allocated, pick another"
          player_X_turn
    end  
  end

  def player_0_turn   #player 2's turn
    puts "#{$player_0} take your turn"
    puts "Which block number would you like?"
    $turn = gets.chomp.to_i
    if $board_numbers[$turn][-1] != "X" && $board_numbers[$turn][-1] != "0"
       $board_numbers[$turn] << "0"
       $turn_count += 1
      if $turn_count >= 9
        puts "GAME OVER!"
        board
        game.exit 
      else
        puts "#{$player_X} take your turn"
        board
        player_X_turn
      end
    else  puts "That space is already allocated, pick another"
          player_0_turn
    end
  end

  def toss # coin toss method
    if rand(2) + 1 == 1
      puts "Heads, #{$player_0} goes first"
      board

      player_0_turn
    else 
      puts "Tails, #{$player_X} goes first"
      board
      player_X_turn
    end
  end
              # this is the intro
  puts "Hi there."
  puts "Welcome to Tic Tac Toe"
  puts "The object of the game is three in a row"
  puts " XXX or 000 wins the game, horizontally, vertically or diagonally"
  puts "Player X enter your name"
  $player_X = gets.chomp           # collects player one's name
  puts "Player 0 enter your name"
  $player_0 = gets.chomp             #collects player two's name
  puts "Great, #{$player_X}, #{$player_0} let's get started!"
  puts "Let's toss a coin to see who goes first"
  puts "Heads, #{$player_0} goes first, tails #{$player_X}"
  toss #tosses a coin to see who goes first                                
end

game
