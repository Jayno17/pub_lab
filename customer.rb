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
end
