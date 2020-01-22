class Pub

attr_reader :name,:till, :drunkenness_limit

  def initialize(name,till,drinks)
    @name = name
    @till = till
    @drinks=drinks
    @drunkenness_limit=5
  end

  def increase_till(amount)
    @till += amount
  end

  def count_drinks
    return @drinks.count
  end

  def decrease_drinks(drink)
    @drinks.delete(drink)
  end

  def check_customer_is_sober(customer)
    if customer.drunkenness < @drunkenness_limit
      return true
    else
      return false
    end
  end










end
