module Walk
  def play_turn(warrior)
    warrior.walk! warrior.direction_of_stairs
  end
end

module Attack
  def play_turn(warrior)
    directions.each do |direction|
      return warrior.attack! direction if warrior.feel(direction).enemy?
    end
    super(warrior)
  end
end

module Rest
  def play_turn(warrior)
    return warrior.rest! unless warrior.health == 20
    super(warrior)
  end
end

module Rescue
  def play_turn(warrior)
    directions.each do |direction|
      return warrior.rescue! direction if warrior.feel(direction).captive?
    end
    super(warrior)
  end
end

module Bind
  def play_turn(warrior)
    return super(warrior) unless surrounded?(warrior)
    warrior.bind! enemy_directions(warrior)[0]
  end

  def surrounded?(warrior)
    enemy_directions(warrior).length > 1
  end

  def enemy_directions(warrior)
    directions.select { |d| warrior.feel(d).enemy? }
  end
end

class Player
  include Walk
  include Rescue
  include Rest
  include Attack
  include Bind

  def directions
    [:forward, :left, :right, :backward]
  end
end
