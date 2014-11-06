class Player

  MAX_HEALTH = 20

  def play_turn(warrior)
    took_damage = warrior.health < (@previous_health || MAX_HEALTH)
    puts "==> Taking damage." if took_damage
    @previous_health = warrior.health
    return warrior.attack! unless warrior.feel.empty?
    return warrior.rest! if warrior.health < MAX_HEALTH && !took_damage
    warrior.walk!
  end
end

