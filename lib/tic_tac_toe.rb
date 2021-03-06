# class TicTacToe
  
#   def initialize
#     @board = Array.new(9, " ")
#   end
  
#   WIN_COMBINATIONS = 
#   [[0, 1, 2], 
#   [3, 4, 5], 
#   [6, 7, 8],
#   [0, 3, 6],
#   [1, 4, 7],
#   [2, 5, 8],
#   [6, 4, 2],
#   [0, 4, 8],]
   
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
   
#   def input_to_index(string)
#     @choose = string.to_i-1
#   end 
   
#   def move(input_to_index, token)
#       @board [input_to_index] = token
#       token == "X" || token == "O"
#   end 
   
#   def position_taken?(input_to_index)
#     if @board [input_to_index] == "X" || @board[input_to_index] == "O"
#       true 
#     else
#       false 
#     end 
#   end
   
#   def valid_move?(input_to_index)
#     !position_taken?(input_to_index)  && @board[input_to_index]
#   end 
   
#   def turn_count
#     count = 0
#     @board.each do |i|
#       count +=1 if i == "X" || i == "O"
#     end 
#     count 
#   end
   
#   def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end 
   
#   def turn 
#     choice = gets.chomp!
#     position = input_to_index(choice)
#     if valid_move?(position)
#       move(position, current_player)
#       display_board
#     else
#     turn
#     end 
#   end 
   
# end

class TicTacToe
  
def initialize(board=nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index]=="X" || @board[index]== "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  

end