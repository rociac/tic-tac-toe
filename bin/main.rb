require_relative "../lib/board.rb"

puts "Player 1 Choose your weapon (X or O)"
weapon = gets.chomp

puts "Player 1 Choose a number from 0 to 8 to place your weapon"
player_choice = gets.chomp

game = Board.new
game.display_board

puts "Player 2 Choose a number from 0 to 8 place your weapon"
player_choice = gets.chomp

game.display_board





