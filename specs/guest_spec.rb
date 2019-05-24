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

  def test_guest_pays_entry_fee__success
    @guest1.pay_fee(20)
    assert_equal(60, @guest1.wallet)
  end

  def test_guest_pays_entry_fee__fail
    assert_equal("John cannot pay entry fee", @guest1.pay_fee(100))
  end
end
