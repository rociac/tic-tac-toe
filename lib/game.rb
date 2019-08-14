# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

# Game logic
class Game
  attr_reader :game_board
  attr_reader :player1
  attr_reader :player2
  attr_accessor :weapon1
  attr_accessor :weapon2

  def initialize
    @game_board = Board.new
    @input = false
    @current_player = 1
    @weapon1 = ''
    @weapon2 = ''
  end

  def create_players(name1, name2)
    @player1 = Player.new(name1, @weapon1)
    @player2 = Player.new(name2, @weapon2)
  end

  def switch_player
    @current_player = @current_player == 1 ? 2 : 1
  end

  def playround
    until @input
      if @current_player == 1
        puts "#{@player1.name.red} choose a number from 0 to 8 to place your weapon"
        @player_choice = gets.chomp.to_i
        if @game_board.board[@player_choice].is_a? Integer
          @game_board.board[@player_choice] = @player1.weapon.red
          @input = true
        end
      else
        puts "#{@player2.name.blue} choose a number from 0 to 8 to place your weapon"
        @player_choice = gets.chomp.to_i
        if @game_board.board[@player_choice].is_a? Integer
          @game_board.board[@player_choice] = @player2.weapon.blue
          @input = true
        end
      end
    end
    switch_player
    @game_board.display_board
    @input = false
  end

  def win_horizontals
    if @game_board.board[0] == @game_board.board[1] && @game_board.board[0] == @game_board.board[2] ||
       @game_board.board[3] == @game_board.board[4] && @game_board.board[3] == @game_board.board[5] ||
       @game_board.board[6] == @game_board.board[7] && @game_board.board[6] == @game_board.board[8]
      true
    end
  end

  def win_verticals
    if @game_board.board[0] == @game_board.board[3] && @game_board.board[0] == @game_board.board[6] ||
       @game_board.board[1] == @game_board.board[4] && @game_board.board[1] == @game_board.board[7] ||
       @game_board.board[2] == @game_board.board[5] && @game_board.board[2] == @game_board.board[8]
      true
    end
  end

  def win_diagonals
    if @game_board.board[0] == @game_board.board[4] && @game_board.board[0] == @game_board.board[8] ||
       @game_board.board[2] == @game_board.board[4] && @game_board.board[2] == @game_board.board[6]
      true
    end
  end

  def win_check
    true if win_horizontals || win_verticals || win_diagonals
  end

  def winner
    @current_player == 2 ? @player1.name : @player2.name
  end

  def draw_check
    true if @game_board.board.none? { |i| i.is_a?(Integer) }
  end
end
