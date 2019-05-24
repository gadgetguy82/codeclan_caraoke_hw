require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("John", 80)
  end

  def test_get_guest_name
    assert_equal("John", @guest1.name)
  end

  def test_get_guest_wallet_amount
    assert_equal(80, @guest1.wallet)
  end
end
