require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../pub.rb")

class TestCustomer <Minitest::Test

 def setup
   @customer = Customer.new("Bill Billerson", 50)
   @drink = Drink.new("Wine",5)
   @drink2 = Drink.new("Champagne", 100)
   @pub = Pub.new("Frog and Bucket", 500, [@drink, @drink2])
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
end
