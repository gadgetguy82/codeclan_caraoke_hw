require('minitest/autorun')
require('minitest/rg')
require_relative('../food')

class FoodTest < Minitest::Test

  def setup
    @food = Food.new("Burger", 4, 3)
  end

  def test_get_food_name
    assert_equal("Burger", @food.name)
  end

  def test_get_food_price
    assert_equal(4, @food.price)
  end

  def test_get_food_sober_level
    assert_equal(3, @food.sober_level)
  end
end
