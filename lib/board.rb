# frozen_string_literal: true

# Board class
class Board
  attr_reader :possible_wins
  attr_accessor :board

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def display_board
    puts '----------'
    puts ' '
    puts @board.slice(0, 3).join('   ')
    puts ' '
    puts @board.slice(3, 3).join('   ')
    puts ' '
    puts @board.slice(6, 3).join('   ')
    puts ' '
    puts '----------'
  end
end
