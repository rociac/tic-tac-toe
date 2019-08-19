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

  context '#winner' do
    it 'should return the name of the winner' do
      allow(game).to receive(:winner).and_return(player.name)
      expect(game.winner).to eql('Name')
    end
  end


end
