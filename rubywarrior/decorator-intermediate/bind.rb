module Bind
  def play_turn(warrior)
    return super(warrior) unless surrounded?(warrior)
    warrior.bind! enemy_directions(warrior)[0]
  end

  def surrounded?(warrior)
    enemy_directions(warrior).length > 1
  end

  def enemy_directions(warrior)
    directions.select { |d| warrior.feel(d).enemy? }
  end
end
