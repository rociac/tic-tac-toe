# frozen_string_literal: true

require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require 'colorize'

RSpec.describe Game do
  let(:game) { Game.new }
  let(:player) { Player.new('Name', 'Weapon') }

  context '#switch_player' do
    it 'should switch the current player' do
      expect(game.switch_player).to eql(2)
    end
  end

  context '#playround' do
    it 'should place the weapon on the board' do
      game.create_players('pl1','pl2')
      game.weapon1 = 'Weapon'
      game.weapon2 = 'Weapon'
      allow(game).to receive(:gets).and_return('4')
      allow(game.playround).to receive(:player_choice)
      expect(game.game_board.board[4]).to eql('Weapon'.red)
    end
  end

  context '#win_check' do
    it 'should return true if a horizontal line is filled with the same weapon' do
      game.game_board.board = ['X', 'X', 'X', 3, 4, 5, 6, 7, 8]
      expect(game.win_check).to eql(true)
    end

    it 'should return true if a vertical line is filled with the same weapon' do
      game.game_board.board = ['X', 1, 2, 'X', 4, 5, 'X', 7, 8]
      expect(game.win_check).to eql(true)
    end

    it 'should return true if a diagonals line is filled with the same weapon' do
      game.game_board.board = ['X', 1, 2 , 3, 'X', 5, 6, 7, 'X']
      expect(game.win_check).to eql(true)
    end
  end

  describe '#draw_check' do
    it 'should return a falsy value if no draw' do
      expect(game.draw_check).to be_falsy
    end

    it 'should return true if no item is an integer' do
      full_board = game.game_board.board.map { 'X' }
      expect(full_board.none? { |i| i.is_a? Integer }).to eql(true)
    end
  end
end
