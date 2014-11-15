module Listen
  def turn
    return super unless listen.any?
    listen.each do |u|
      d = direction_of(u)
      return walk! d unless feel(d).stairs?
    end

    directions.each do |d|
      return walk! d if feel(d).empty? && !feel(d).stairs?
    end
  end
end
