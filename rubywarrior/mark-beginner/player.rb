class Player
  MAX_HEALTH = 20

  attr_accessor :health, :previous_health, :warrior

  def play_turn(warrior)
    self.warrior = warrior
    return kill! if something_to_kill?
    return backup! if took_damage? && hurting_badly?
    return warrior.rest! unless healthy? || took_damage?
    return warrior.rescue! if warrior.feel.captive?
    return warrior.pivot! if warrior.feel.wall?
    warrior.walk!
  end

  protected

  def backup!
    warrior.walk! :backward
  end

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
    next_to_enemy? || see_enemy?
  end

  def kill!
    return warrior.attack! if next_to_enemy?
    return warrior.shoot! if see_enemy?
  end

  def next_to_enemy?
    warrior.feel.enemy?
  end

  def see_enemy?
    thing = nearest_thing
    thing && thing.enemy?
  end

  def nearest_thing
    warrior.look.find { |s| !s.empty? }
  end

  def took_damage?
    health < previous_health
  end

  def healthy?
    health == MAX_HEALTH
  end
end
