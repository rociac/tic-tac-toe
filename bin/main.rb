require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/messages.rb'
require 'colorize'
weapon = ""
game = Board.new

Messages.welcome

puts "Enter name for player 1"
name = gets.chomp

until weapon == "X" || weapon == "O" do
  puts "Choose your weapon (X or O)"
  weapon = gets.chomp.upcase!
end

player1 = Player.new(name, weapon)

weapon == "X" ? weapon = "O" : weapon = "X" 

puts "Enter name for player 2"
name = gets.chomp

player2 = Player.new(name, weapon)

game.display_board

5.times do
  Messages.player
  player_choice = gets.chomp.to_i

  if game.board[player_choice].is_a? Integer
    game.board[player_choice] = player1.weapon.red 
  else
    Messages.player
    player_choice = gets.chomp.to_i
  end

  game.display_board

  Messages.player
  player_choice = gets.chomp.to_i

  if game.board[player_choice].is_a? Integer
    game.board[player_choice] = player2.weapon.blue
  else
    Messages.player
    player_choice = gets.chomp.to_i
  end
  game.display_board
end


