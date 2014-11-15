module Rescue
  def turn
    directions.each do |direction|
      return rescue! direction if feel(direction).captive?
    end
    super
  end
end
