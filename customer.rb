class Customer
  attr_reader :drunkenness
  attr_accessor :wallet

  def initialize(name, wallet,age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
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
    if customer_can_afford_drink?(drink) && pub.check_customer_is_sober(self)
      take_from_wallet(drink.price)
      pub.increase_till(drink.price)
      pub.decrease_drinks(drink)
      increase_drunkenness(drink)
    else
      return "Sorry, you can't have a drink."
    end
  end


  def old_enough?
    if @age >= 18
      return true
    else
      return false
    end
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

 def decrease_drunkenness(food)
   @drunkenness -= food.rejuvenation_level
 end

end
