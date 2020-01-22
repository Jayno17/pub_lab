class Pub

attr_reader :name,:till, :drunkenness_limit

  def initialize(name,till,drinks, foods)
    @name = name
    @till = till
    @drinks=drinks
    @foods=foods
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

  def sell_food(customer,food)
    customer.wallet -= food.price
  end

end
