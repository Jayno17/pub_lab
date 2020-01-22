require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../drink.rb")

class TestDrink <Minitest::Test

 def setup()
  @drink = Drink.new("Tennent's", 3)
  end

 def test_drink_has_name
  assert_equal("Tennent's", @drink.name)
 end

 def test_drink_has_price
   assert_equal(3,@drink.price)
end

end
