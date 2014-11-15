module Rest
  def turn
    return rest! unless health == 20
    super
  end
end
