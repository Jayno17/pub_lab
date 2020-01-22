require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer.rb")
require_relative("../drink.rb")

class TestCustomer <Minitest::Test

 def setup
   @customer = Customer.new("Bill Billerson", 50)
   @drink = Drink.new("Wine",5)
 end

 def test_take_from_wallet
   @customer.take_from_wallet(@drink.price)
   assert_equal(45, @customer.wallet)
 end
end
