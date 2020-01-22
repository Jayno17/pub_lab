class Customer
  attr_reader :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def take_from_wallet(cost)
    @wallet -= cost
  end

  def customer_can_afford_drink?(drink)
    if drink.price <= @wallet
      return true
    else
      return false
    end
  end

  def buy_drink(pub, drink)
    if customer_can_afford_drink?(drink)
      take_from_wallet(drink.price)
      pub.increase_till(drink.price)
      pub.decrease_drinks(drink)
    else
      return "Sorry, you can't have a drink."
    end
  end
end
