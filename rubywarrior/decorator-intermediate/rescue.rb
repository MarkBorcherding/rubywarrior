module Rescue
  def play_turn(warrior)
    directions.each do |direction|
      return warrior.rescue! direction if warrior.feel(direction).captive?
    end
    super(warrior)
  end
end
