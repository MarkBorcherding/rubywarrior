require_relative 'walk'
require_relative 'attack'
require_relative 'rest'
require_relative 'rescue'
require_relative 'bind'

module Listen
  def turn
    return warrior.walk! warrior.direction_of nearby_units[0] if nearby_units.any?
    super
  end

  def nearby_units
    warrior.listen
  end
end

class Player
  include Walk
  include Listen
  include Rescue
  include Rest
  include Attack
  include Bind

  attr_accessor :warrior

  def directions
    [:forward, :left, :right, :backward]
  end

  def play_turn(warrior)
    self.warrior = warrior
    turn
  end

  def turn
    super
  end
end
