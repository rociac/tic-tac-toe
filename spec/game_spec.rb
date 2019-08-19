# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player_choice) { 4 }
  let(:game_board) { Board.new }
  let(:player) { Player.new('Name', 'Weapon') }

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

  context '#win_check' do
    it 'should return true if a horizontal line is filled with the same weapon' do
      allow(game).to receive(:win_horizontals).and_return(true)
      expect(game.win_check).to eql(true)
    end

    it 'should return true if a vertical line is filled with the same weapon' do
      allow(game).to receive(:win_verticals).and_return(true)
      expect(game.win_check).to eql(true)
    end

    it 'should return true if a diagonals line is filled with the same weapon' do
      allow(game).to receive(:win_diagonals).and_return(true)
      expect(game.win_check).to eql(true)
    end   
  end

  describe '#draw_check' do
    it 'should return a falsy value if no draw' do
      expect(game.draw_check).to be_falsy
    end

    it 'should return true if no item is an integer' do
      full_board = game_board.board.map { |i| i = 'X' }
      expect(full_board.none? {|i| i.is_a? Integer}).to eql(true)
    end
  end
end
