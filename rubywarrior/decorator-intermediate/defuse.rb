module Defuse
  def turn
    return super unless ticking.any?
    adjacent_tickers.each { |d| return rescue! d }
    ticking.each { |d| return walk! d }
  end

  def ticking
    listen.select &:ticking?
  end

  def adjacent_tickers
    directions.select(&method(:captive?))
  end
end
