module Rescue
  def turn
    directions.each do |direction|
      return warrior.rescue! direction if warrior.feel(direction).captive?
    end
    super
  end
end
