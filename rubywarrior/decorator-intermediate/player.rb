module Walk
  def play_turn(warrior)
    warrior.walk! warrior.direction_of_stairs
  end
end

class Player
  include Walk
end
