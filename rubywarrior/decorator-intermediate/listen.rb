module Listen
  def turn
    return super unless listen.any?
    walk! (direction_to_enemys + empty_spaces).reject(&method(:stairs?))[0]
  end

  def direction_to_enemys
    listen.map(&method(:direction_of))
  end

  def empty_spaces
    directions.select(&method(:empty?))
  end

  def empty?(direction)
    feel(direction).empty?
  end

  def stairs?(direction)
    feel(direction).stairs?
  end
end
