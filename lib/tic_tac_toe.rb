class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
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

def move(position, token)
  @board[position] = token
end

def position_taken?(index)
  ((@board[index] == "X") || (@board[index] == "O"))
end

def valid_move?(position)
  position.between?(0,8) && !position_taken?(position)
end

def turn_count
  number_of_turns = 0 
  @board.each do |space|
  if space == "X" || space =="O"
    number_of_turns += 1 
  end
end
return number_of_turns
end  

def current_player
  if turn_count % 2 == 0 
    "X"
  else
    "O"
  end  
 end
 
 def turn 
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   char = current_player
   if valid_move?(index)
     move(index, char)
     display_board
   else
     turn
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
    return win_combo
    end
      false
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end  

  def draw?
    if won?
      return false
    elsif full? == false
      return false
    else
      return true
    end
  end

  def over?
    if won? || draw? == true
      return true
    else
      return false
    end
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end
end

