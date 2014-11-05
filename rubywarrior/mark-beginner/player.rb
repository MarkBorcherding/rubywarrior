class Player
  def play_turn(warrior)
    return warrior.attack! unless warrior.feel.empty?
    return warrior.rest! unless warrior.health == 20
    warrior.walk!
  end
end
