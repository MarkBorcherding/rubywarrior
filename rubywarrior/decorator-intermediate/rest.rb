module Rest
  def turn
    return rest! unless healthy?
    super
  end
end
