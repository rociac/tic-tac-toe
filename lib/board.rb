class Board
  attr_reader :possible_wins
  attr_accessor :board
  def initialize
    @possible_wins = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    @board = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
  end

  def display_board
    @board.each do |cell|
      print cell
      print "\n"
    end
  end

end
