module Rest
  def play_turn(warrior)
    return warrior.rest! unless warrior.health == 20
    super(warrior)
  end
end
