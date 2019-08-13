# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require 'colorize'

game = Game.new
weapon1 = ''
weapon2 = ''
input = false

puts 'Welcome to Tic-Tac-Toe game'
puts 'Press Enter to continue'
gets

puts 'Enter name for player 1'
name1 = gets.chomp

until weapon1 == 'X' || weapon1 == 'O'
  puts 'Choose your weapon (X or O)'
  weapon1 = gets.chomp.upcase!
end

weapon1 == 'X' ? weapon2 = 'O' : weapon2 = 'X'

puts 'Enter name for player 2'
name2 = gets.chomp

game.create_players(name1, name2, weapon1, weapon2)

game.game_board.display_board

until game.win_check || game.draw_check
  game.playround
end

if game.win_check
  puts "#{game.winner} won the game!".yellow.on_red
else
  puts 'It\'s a draw!'.yellow.on_red
end

puts 'Do you want to play again? Y/N'
playagain = gets.chomp