require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @song1 = Song.new("Livin La Vida Loca")
    @guest1 = Guest.new("John", 80, @song1)
  end

  def test_get_guest_name
    assert_equal("John", @guest1.name)
  end

  def test_get_guest_wallet_amount
    assert_equal(80, @guest1.wallet)
  end

  def test_get_guest_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_guest_pays_entry_fee__success
    @guest1.pay_fee(20)
    assert_equal(60, @guest1.wallet)
  end

  def test_guest_pays_entry_fee__fail
    assert_equal("John cannot pay entry fee", @guest1.pay_fee(100))
  end
end
