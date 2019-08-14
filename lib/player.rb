# frozen_string_literal: true

# Player Class
class Player
  attr_reader :name
  attr_reader :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
  end
end
