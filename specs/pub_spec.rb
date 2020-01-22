require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub.rb")
require_relative("../drink.rb")

class TestPub <Minitest::Test

  def setup
    @drink1=Drink.new("Lager",4)
    @drink2=Drink.new("Wine",5)
    @pub= Pub.new("Brewdog",1000,[@drink1,@drink2])
  end

  def test_pub_name
    assert_equal("Brewdog",@pub.name)
  end

  def test_till
    assert_equal(1000,@pub.till)
  end

  def test_increase_till
    @pub.increase_till(500)
    assert_equal(1500,@pub.till)
  end

  def test_count_drinks
    assert_equal(2, @pub.count_drinks)
  end

  # def test_decrease_drinks
  #   @pub.decrease_drinks(@drink1)
  #   assert_equal(1, @pub.)
  # end


end
