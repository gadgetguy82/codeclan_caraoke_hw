class Food
  attr_reader :name, :price, :sober_level

  def initialize(name, price, level)
    @name = name
    @price = price
    @sober_level = level
  end
end
