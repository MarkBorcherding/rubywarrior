module Listen
  def turn
    return super unless listen.any?
    listen
      .map(&method(:direction_of))
      .reject(&method(:stairs?))
      .each do |d|
        return walk! d
      end

    directions
      .reject(&method(:stairs?))
      .select(&method(:empty?))
      .each do |d|
        return walk! d
      end

    fail 'never get here'
  end

  def empty?(direction)
    feel(direction).empty?
  end

  def stairs?(direction)
    feel(direction).stairs?
  end
end
