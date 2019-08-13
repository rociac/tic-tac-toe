# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require 'colorize'

weapon = ''
input = false
game = Board.new

puts 'Welcome to Tic-Tac-Toe game'
puts 'Press Enter to continue'
gets

puts 'Enter name for player 1'
name = gets.chomp

until weapon == 'X' || weapon == 'O'
  puts 'Choose your weapon (X or O)'
  weapon = gets.chomp.upcase!
end

player1 = Player.new(name, weapon)

weapon == 'X' ? weapon = 'O' : weapon = 'X'

puts 'Enter name for player 2'
name = gets.chomp

player2 = Player.new(name, weapon)

game.display_board

5.times do
  until input
    puts "#{player1.name.red} choose a number from 0 to 8 to place your weapon"
    player_choice = gets.chomp.to_i
    if game.board[player_choice].is_a? Integer
      game.board[player_choice] = player1.weapon.red
      input = true
    end
  end

  game.display_board
  input = false

  until input
    puts "#{player2.name.blue} choose a number from 0 to 8 to place your weapon"
    player_choice = gets.chomp.to_i
    if game.board[player_choice].is_a? Integer
      game.board[player_choice] = player2.weapon.blue
      input = true
    end
  end

  game.display_board
  input = false
end
