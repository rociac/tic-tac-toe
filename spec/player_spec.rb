# frozen_string_literal: true

require_relative '../lib/player.rb'

RSpec.describe Player do
  let(:player) { described_class.new('player1', 'X') }

  it 'should have a name' do
    expect(player.name).to eql('player1')
  end

  it 'should have a weapon' do
    expect(player.weapon).to eql('X')
  end
end
