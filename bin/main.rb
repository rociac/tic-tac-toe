require_relative "../lib/board.rb"
require_relative "../lib/player.rb"
weapon = ""
game = Board.new
current_player = 1

puts "Welcome to Tic-Tac-Toe"
puts "Press enter to start"
gets

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
  puts "#{player1.name} choose a number from 0 to 8 to place your weapon"
  player_choice = gets.chomp.to_i

  game.board[player_choice] = player1.weapon
  game.display_board

  puts "#{player2.name} Choose a number from 0 to 8 to place your weapon"
  player_choice = gets.chomp.to_i

  game.board[player_choice] = player2.weapon
  game.display_board 
end







