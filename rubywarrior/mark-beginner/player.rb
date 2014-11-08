class Player
  MAX_HEALTH = 20

  attr_accessor :health, :previous_health, :warrior

  def play_turn(warrior)
    self.warrior = warrior

    kill ||
    retreat ||
    rest ||
    free_captive ||
    turn_around ||
    walk
  end

  protected

  def warrior=(value)
    self.health = value.health
    @warrior = value
  end

  def health=(value)
    self.previous_health = health || MAX_HEALTH
    @health = value
  end

  def retreat
    warrior.walk! :backward if took_damage? && hurting_badly?
  end

  def rest
    warrior.rest! unless healthy? || took_damage?
  end

  def free_captive
    warrior.rescue! if warrior.feel.captive?
  end

  def turn_around
    warrior.pivot! if warrior.feel.wall?
  end

  def hurting_badly?
    health < MAX_HEALTH / 2
  end

  def walk
    warrior.walk!
  end

  def kill
    stab || shoot
  end

  def stab
    warrior.attack! if next_to_enemy?
  end

  def shoot
    warrior.shoot! if see_enemy?
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
