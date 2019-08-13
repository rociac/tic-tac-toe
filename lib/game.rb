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
  end

  def create_players(name1, name2, weapon1, weapon2)
    @player1 = Player.new(name1, weapon1)
    @player2 = Player.new(name2, weapon2)
  end

  def userinput
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
  end

  def reset
  end

  def win_check
  end

  def draw_check

  end
end