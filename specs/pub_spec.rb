require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestPub <Minitest::Test

  def setup
    @drink1=Drink.new("Lager",4,1)
    @drink2=Drink.new("Wine",5,2)
    @pub= Pub.new("Brewdog",1000,[@drink1,@drink2])
    @customer = Customer.new("Bill Billerson", 50 ,18)
    @customer2 = Customer.new("Jim Jameson",10 , 17)
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

  def test_decrease_drinks
    @pub.decrease_drinks(@drink1)
    assert_equal(1, @pub.count_drinks)
  end

  def test_check_customer_is_sober__true
    assert_equal(true,@pub.check_customer_is_sober(@customer))
  end

  def test_check_customer_is_sober__false
    drink=Drink.new("Vodka",2,5)
    new_pub=Pub.new("Pig and Whistle",100,[drink])
    @customer.buy_drink(new_pub,drink)
    assert_equal(false,new_pub.check_customer_is_sober(@customer))
  end

end
