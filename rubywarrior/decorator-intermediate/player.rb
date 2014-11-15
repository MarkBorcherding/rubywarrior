require_relative 'walk'
require_relative 'attack'
require_relative 'rest'
require_relative 'rescue'
require_relative 'bind'

class Player
  include Walk
  include Rescue
  include Rest
  include Attack
  include Bind

  def directions
    [:forward, :left, :right, :backward]
  end
end
