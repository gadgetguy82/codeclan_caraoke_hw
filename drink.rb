class Drink
  attr_reader :name, :price, :alcohol_level

  def initialize(name, price, level)
    @name = name
    @price = price
    @alcohol_level = level
  end
end
