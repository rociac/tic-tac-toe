# frozen_string_literal: true

require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:game_board) { Board.new }

  describe "#initialize" do
    it 'should make an array of 9 items' do
      expect(game_board.board.length).to eql(9)
    end
  end
  
  describe "#display_board" do
    it 'should display the board and return nil' do
      expect(game_board.display_board).to be_nil
    end
  end
end