module Bind
  def turn
    return super unless surrounded?
    warrior.bind! enemy_directions[0]
  end

  def surrounded?
    enemy_directions.length > 1
  end

  def enemy_directions
    directions.select { |d| warrior.feel(d).enemy? }
  end
end
