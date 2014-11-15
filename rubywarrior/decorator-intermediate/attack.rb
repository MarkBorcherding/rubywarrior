module Attack
  def turn
    directions.each do |direction|
      return warrior.attack! direction if warrior.feel(direction).enemy?
    end
    super
  end
end
