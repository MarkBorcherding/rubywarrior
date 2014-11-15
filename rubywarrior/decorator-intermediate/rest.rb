module Rest
  def turn
    return warrior.rest! unless warrior.health == 20
    super
  end
end
