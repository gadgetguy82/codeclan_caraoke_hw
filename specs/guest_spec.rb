require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')

class GuestTest < Minitest::Test

  def setup
    @song1 = Song.new("Livin La Vida Loca")
    @guest1 = Guest.new("John", 80, @song1)
    @drink1 = Drink.new("Rum", 8, 3)
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

  def test_guest_can_sing_song
    assert_equal("Verse, chorus", @guest1.sing_song(@song1))
  end

  # test below includes function which uses random generation
  # def test_slur_song
  #   @guest1.buy_drink(@drink1)
  #   @guest1.buy_drink(@drink1)
  #   @guest1.buy_drink(@drink1)
  #   p @guest1.sing_song(@song1)
  # end
end
