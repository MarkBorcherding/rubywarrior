require 'forwardable'
require_relative 'attack'
require_relative 'bind'
require_relative 'defuse'
require_relative 'listen'
require_relative 'rescue'
require_relative 'rest'
require_relative 'walk'

class Player
  include Walk
  include Listen
  include Rescue
  include Rest
  include Attack
  include Defuse
  include Bind

  attr_accessor :warrior

  extend Forwardable
  def_delegators :warrior,
                 :attack!,
                 :bind!,
                 :direction_of,
                 :direction_of_stairs,
                 :feel,
                 :health,
                 :listen,
                 :rest!,
                 :rescue!

  MAX_HEALTH = 20

  def play_turn(warrior)
    self.warrior = warrior
    turn
  end

  private

  def directions
    [:forward, :left, :right, :backward]
  end

  def turn
    super
  end

  def healthy?
    health == MAX_HEALTH
  end

  def captive?(direction)
    feel(direction).captive?
  end

  def walk!(d)
    d = direction_of(d) if d.is_a? RubyWarrior::Space

    require 'byebug'
    byebug if d == nil

    return side_step(d) unless walkable?(d)
    warrior.walk! d
  end

  def walkable?(direction)
    feel(direction).empty? or feel(direction).stairs?
  end

  def side_step(direction)
    directions
      .reject { |d| d == direction }
      .reject { |d| d == opposite_direction(direction) }
      .select { |d| feel(d).empty? }
      .each do |d|
      return warrior.walk! d
    end
  end

  def opposite_direction(direction)
    {
      left: :right,
      right: :left,
      backward: :forward,
      forward: :backward
    }[direction]
  end

end
