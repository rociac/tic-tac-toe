# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require 'colorize'

game = Game.new
play = 'Y'

puts 'Welcome to Tic-Tac-Toe game'
puts 'Press Enter to continue'
gets

until play == 'N'
  puts 'Enter name for player 1'
  name1 = gets.chomp

  until game.weapon1 == 'X' || game.weapon1 == 'O'
    puts 'Choose your weapon (X or O)'
    game.weapon1 = gets.chomp.upcase!
  end

  game.weapon2 = game.weapon1 == 'X' ? 'O' : 'X'

  puts 'Enter name for player 2'
  name2 = gets.chomp

  game.create_players(name1, name2)

  game.game_board.display_board

  until game.win_check || game.draw_check; game.playround end

  if game.win_check
    puts "#{game.winner} won the game!".yellow.on_red
  else
    puts 'It\'s a draw!'.yellow.on_red
  end

  puts 'Do you want to play again? Y/N'
  play = gets.chomp.upcase!
  if play == 'Y'
    play = 'Y'
    game = Game.new
  else
    play = 'N'
    puts 'Thanks for playing!'
  end
end
