module Walk
  def play_turn(warrior)
    warrior.walk! warrior.direction_of_stairs
  end
end

module Attack
  def play_turn(warrior)
    [:forward, :left, :right, :backward].each do |direction|
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

class Player
  include Walk
  include Rest
  include Attack
end
