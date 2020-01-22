require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../food.rb")

class TestFood <Minitest::Test

 def setup()
  @food = Food.new("Burger", 6, 2)
  end

end
