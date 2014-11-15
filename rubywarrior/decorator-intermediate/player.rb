require 'forwardable'
require_relative 'walk'
require_relative 'attack'
require_relative 'rest'
require_relative 'rescue'
require_relative 'bind'
require_relative 'listen'

class Player
  include Walk
  include Listen
  include Rescue
  include Rest
  include Attack
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
                 :rescue!,
                 :walk!

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
end
