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

  def walk
    warrior.walk!
  end

  def kill
    stab || shoot
  end

  def stab
    warrior.attack! if next_to_enemy?
  end

  def next_to_enemy?
    warrior.feel.enemy?
  end

  def shoot
    shoot_at direction_to_ranged_enemy
  end

  def shoot_at(direction)
    warrior.shoot! direction if direction
  end

  def direction_to_ranged_enemy
    spaces = warrior.look(:forward).zip warrior.look(:backward)
    spaces.each do |space|
      return :forward if ranged_enemy?(space[0])
      return :backward if ranged_enemy?(space[1])
    end
    nil
  end

  def ranged_enemy?(space)
    # Is this cheating?
    [RubyWarrior::Units::Archer,
     RubyWarrior::Units::Wizard].any? do |c|
      space.unit.is_a? c
    end
  end

  def hurting_badly?
    health < MAX_HEALTH / 2
  end

  def took_damage?
    health < previous_health
  end

  def healthy?
    health == MAX_HEALTH
  end
end
