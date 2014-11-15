module Listen
  def turn
    return walk! direction_of nearby_units[0] if nearby_units.any?
    super
  end

  def nearby_units
    warrior.listen
  end
end
