class Player

  MAX_HEALTH = 20

  attr_accessor :health, :previous_health

  def play_turn(warrior)
    self.health = warrior.health
    return warrior.attack! unless warrior.feel.empty? || warrior.feel.captive?
    return warrior.rest! unless healthy? or took_damage?
    return warrior.rescue! if warrior.feel.captive?
    warrior.walk!
  end

  protected

  def health=(value)
    self.previous_health = health || MAX_HEALTH
    @health = value
  end

  def took_damage?
    health < previous_health
  end

  def healthy?
    health == MAX_HEALTH
  end
end

