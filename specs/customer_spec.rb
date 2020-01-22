require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../pub.rb")
require_relative("../food.rb")

class TestCustomer <Minitest::Test

 def setup
   @customer = Customer.new("Bill Billerson", 50 ,18)
   @customer2 = Customer.new("Jim Jameson",10 , 17)
   @drink = Drink.new("Wine",5,2)
   @drink2 = Drink.new("Champagne", 100,2)
   @food1 = Food.new("Burger", 6, 2)
   @food2 = Food.new("Nachos", 4, 1)
   @pub = Pub.new("Frog and Bucket", 500, [@drink, @drink2],[@food1, @food2])
 end

 def test_take_from_wallet()
   @customer.take_from_wallet(@drink.price)
   assert_equal(45, @customer.wallet)
 end

def test_customer_can_afford_drink__true()
  assert_equal(true, @customer.customer_can_afford_drink?(@drink))
end
 def test_customer_can_afford_drink__false
   assert_equal(false, @customer.customer_can_afford_drink?(@drink2))
 end

 def test_buy_drink__can_afford()
   @customer.buy_drink(@pub, @drink)
   assert_equal(1, @pub.count_drinks)
   assert_equal(505, @pub.till)
   assert_equal(45, @customer.wallet)
 end

 def test_buy_drink__cannot_afford()
   @customer.buy_drink(@pub, @drink2)
   assert_equal(2, @pub.count_drinks)
   assert_equal(500, @pub.till)
   assert_equal(50, @customer.wallet)
end

  def test_customer_is_old_enough__true
    assert_equal(true, @customer.old_enough?)
  end

  def test_customer_is_old_enough__false
    assert_equal(false, @customer2.old_enough?)
  end

  def test_increase_drunkenness
    @customer.increase_drunkenness(@drink)
    assert_equal(2,@customer.drunkenness)
  end

  def test_buy_drink__not_sober_can_afford()
    @customer.buy_drink(@pub, @drink)
    assert_equal(1, @pub.count_drinks)
    assert_equal(505, @pub.till)
    assert_equal(45, @customer.wallet)
 end

  def test_buy_drink__not_sober_cant_afford()
    drink=Drink.new("Vodka",2,5)
    drink2=Drink.new("Vodka",2,5)
    new_pub=Pub.new("Pig and Whistle",100,[drink, drink2],[])
    @customer.buy_drink(new_pub, drink)
    assert_equal(1, new_pub.count_drinks)
    assert_equal(102, new_pub.till)
    assert_equal(48, @customer.wallet)
 end

  def test_decrease_drunkenness()
   @customer.decrease_drunkenness(@food1)
   assert_equal(-2, @customer.drunkenness)
 end
end
