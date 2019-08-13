# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'


# Game logic
class Game
attr_reader :game_board
attr_reader :player1
attr_reader :player2

  def initialize 
    @game_board = Board.new
    @input = false
    @current_player = 1
  end

  def create_players(name1, name2, weapon1, weapon2)
    @player1 = Player.new(name1, weapon1)
    @player2 = Player.new(name2, weapon2)
  end

  def userinput
    
  end

  def switch_player
    if @current_player == 1
      @current_player = 2
    else
      @current_player = 1
    end
  end

  def playround

    until @input
      puts "#{@player1.name.red} choose a number from 0 to 8 to place your weapon"
      @player_choice = gets.chomp.to_i
      if @game_board.board[@player_choice].is_a? Integer
        @game_board.board[@player_choice] = @player1.weapon.red
        @input = true
      end
    end
    
    @game_board.display_board
    @input = false
  
    until @input
      puts "#{@player2.name.blue} choose a number from 0 to 8 to place your weapon"
      @player_choice = gets.chomp.to_i
      if @game_board.board[@player_choice].is_a? Integer
        @game_board.board[@player_choice] = @player2.weapon.blue
        @input = true
      end
    end
    @game_board.display_board
    @input = false
    win_check
  end

  def reset
  end

  def win_check
    if @game_board.board[0] == @game_board.board[3] && @game_board.board[0] == @game_board.board[6] || 
       @game_board.board[1] == @game_board.board[4] && @game_board.board[1] == @game_board.board[7] ||
       @game_board.board[2] == @game_board.board[5] && @game_board.board[2] == @game_board.board[8] ||
       @game_board.board[0] == @game_board.board[1] && @game_board.board[0] == @game_board.board[2] ||
       @game_board.board[3] == @game_board.board[4] && @game_board.board[3] == @game_board.board[5] ||
       @game_board.board[6] == @game_board.board[7] && @game_board.board[6] == @game_board.board[8] ||
       @game_board.board[0] == @game_board.board[4] && @game_board.board[0] == @game_board.board[8] ||
       @game_board.board[2] == @game_board.board[4] && @game_board.board[2] == @game_board.board[6]
        return true
    end
  end

  def draw_check

  end
end


#takes user input
# puts the weapon on the cell
#win check
#if false
#current player = player 2
#starts over