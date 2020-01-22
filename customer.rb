class Customer
  attr_reader :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def take_from_wallet(cost)
    @wallet -= cost
  end
end
