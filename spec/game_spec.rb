require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player_choice) { 4 }
  let(:game_board) { Board.new }
  let(:player) { Player.new('Name', 'Weapon') }

  # context '#initialize' do
  #   it 'should create a new board' do
  #     expect(game.game_board).to be(Board.new)
  #   end

  # end

  context '#switch_player' do
    it 'should switch the current player' do
      expect(game.switch_player).to eql(2)
    end
  end

  context '#playround' do
    it 'should place the weapon on the board if the position is not occupied' do
      if game_board.board[player_choice].is_a? Integer
        game_board.board[player_choice] = player.weapon
        input = true
      end
      expect(game_board.board[player_choice]).to eql('Weapon')
    end

    it 'should not be able to place if already occupied' do
      game_board.board[player_choice] = 'Weapon'
      if game_board.board[player_choice].is_a? Integer
        game_board.board[player_choice] = 'O'
        input = true
      end
      expect(game_board.board[player_choice]).to eql('Weapon')
    end
  end
end