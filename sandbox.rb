#MAKE ALL OTHER METHODS PRIVATE!
#Refactor x && y && part of if statement - big if/else and mini inside


  def place_on_board
    array = []
    until array.length == 9 #refactor to until game is won
      if @p1_turn
        puts "#{@player1}, choose a spot on the tic tac toe board."
      else
        puts "#{@player2}, choose a spot on the tic tac toe board."
      end
    end
    puts "The game is a draw - neither player has won."
  end

  def turn
    position = gets.chomp
    if array.include?(position)
      puts "That spot is already taken!"
    elsif
      @board.include?(position)
      @board[position].status = "X"
      display_board
      array << position
      @p1_turn = false
    else
      puts "This spot does not exist on the board. Sorry sucka!"
    end
  end

  def placeholder
    array = []
    until array.length == 9 #refactor to until the game is won!!!
      puts "Choose a spot on the tic tac toe board."
      spot = gets.chomp
      if position.occupied
        puts "That spot is already taken!"
      elsif
        @board.each do |row|
          row.each do |position|
            position.status = true
          end
        end
        array << position
      else
        puts "This spot does not exist on the board. Sorry sucka!"
      end
    end
  end
