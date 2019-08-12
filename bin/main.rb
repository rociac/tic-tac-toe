require_relative "../lib/board.rb"

weapons = []

puts "Player 1 Choose your weapon (X or O)"
weapons[0] = gets.chomp.upcase!
game = Board.new

if weapons[0] == "X"
  weapons[1] = "O"
elsif weapons[0] == "O"
  weapons[1] = "X"
end
game.display_board

5.times do 

puts "Player 1 Choose a number from 0 to 8 to place your weapon"
player_choice = gets.chomp.to_i

if player_choice == 0
  game.board[0][0] = :X
end
game.display_board
 puts "Player 2 Choose a number from 0 to 8 place your weapon"
 player_choice = gets.chomp

if player_choice == 1
   game.board[0][1] = :O
end
game.display_board

end






