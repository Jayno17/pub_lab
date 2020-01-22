class Pub

attr_reader :name,:till

  def initialize(name,till,drinks)
    @name = name
    @till = till
    @drinks=drinks
  end

  def increase_till(amount)
    @till += amount
  end

  def count_drinks
    return @drinks.count
  end










end
