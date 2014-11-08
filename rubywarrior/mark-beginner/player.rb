class Player
  MAX_HEALTH = 20

  attr_accessor :health, :previous_health, :warrior

  def play_turn(warrior)
    self.warrior = warrior
    return warrior.attack! if something_to_kill?
    return warrior.walk! :backward if took_damage? && hurting_badly?
    return warrior.rest! unless healthy? || took_damage?
    return warrior.rescue! if warrior.feel.captive?
    return warrior.pivot! if warrior.feel.wall?
    warrior.walk!
  end

  protected

  def hurting_badly?
    health < MAX_HEALTH / 2
  end

  def warrior=(value)
    self.health = value.health
    @warrior = value
  end

  def health=(value)
    self.previous_health = health || MAX_HEALTH
    @health = value
  end

  def something_to_kill?
    warrior.feel.enemy?
  end

  def took_damage?
    health < previous_health
  end

  def healthy?
    health == MAX_HEALTH
  end
end
