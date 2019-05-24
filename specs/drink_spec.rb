require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

  def setup
    @drink1 = Drink.new("Vodka", 5, 2)
  end

  def test_get_drink_name
    assert_equal("Vodka", @drink1.name)
  end

  def test_get_drink_price
    assert_equal(5, @drink1.price)
  end

  def test_get_alcohol_level
    assert_equal(2, @drink1.alcohol_level)
  end
end
