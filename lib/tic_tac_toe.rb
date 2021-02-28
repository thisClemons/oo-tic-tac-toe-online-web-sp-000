require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)

     index.between?(0, 8) && !position_taken?(index)


    # valid_move = true
    # valid_move = false if index > 8 || index < 0
    # valid_move = false if position_taken?(index)
    # valid_move
  end

  def turn_count
    turns = 0
    @board.each {|spot| turns += 1 if spot != " "}
    turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9"
    turn_input = gets.strip
    turn_index = input_to_index(turn_input)

    if valid_move?(turn_index)
      player = current_player
      move(turn_index, player)
    else
      turn
    end
    display_board
   end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.none? {|spot| spot == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil

  end


  def play
   turn until over?

   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end

  end
  #binding.pry
end
