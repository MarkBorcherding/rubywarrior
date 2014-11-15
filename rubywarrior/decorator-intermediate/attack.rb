module Attack
  def play_turn(warrior)
    directions.each do |direction|
      return warrior.attack! direction if warrior.feel(direction).enemy?
    end
    super(warrior)
  end
end
