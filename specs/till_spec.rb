require('minitest/autorun')
require('minitest/rg')
require_relative('../till')

class TillTest < Minitest::Test

  def setup
    @till = Till.new(500)
  end

  def test_get_cash_flow_in_till
    assert_equal(500, @till.cash_flow)
  end

  def test_add_sale_to_till
    assert_equal(520, @till.add_sale(20))
  end
end
