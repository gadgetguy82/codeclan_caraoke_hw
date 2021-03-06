require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')
require_relative('../food')

class RoomTest < Minitest::Test

  def setup
    @song1 = Song.new("Perfect Day")
    @song2 = Song.new("Uptown Girl")

    @drink1 = Drink.new("Whisky", 10, 2)
    @drink2 = Drink.new("Rum", 6, 3)

    @food1 = Food.new("Burger", 4, 3)

    @room1 = Room.new(1, 10)
    @room2 = Room.new(2, 15)
    @room3 = Room.new(3, 3)

    @guest1 = Guest.new("Fred", 100, @song2)
    @guest2 = Guest.new("Kim", 20, @song1)
    @guest3 = Guest.new("Rachel", 50, @song1)
    @guest4 = Guest.new("Victor", 10, @song2)

    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    @room2.check_in(@guest3)
    @room2.add_song(@song1)

    @room3.check_in(@guest2)
    @room3.check_in(@guest3)
    @room3.check_in(@guest4)
  end

  def test_get_room_number
    assert_equal(1, @room1.number)
  end

  def test_check_guest_into_room
    @room1.check_in(@guest1)
    assert_equal([@guest1], @room1.guests)
  end

  def test_check_guest_out_of_room__success
    @room2.check_out(@guest2)
    assert_equal([@guest1, @guest3], @room2.guests)
  end

  def test_check_guest_out_of_room__fail
    assert_equal("Victor is not in room 2", @room2.check_out(@guest4))
  end

  def test_add_song_to_room
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal([@song1, @song2], @room1.songs)
  end

  def test_add_list_of_songs_to_room
    @room1.add_song([@song1, @song2])
    assert_equal([@song1, @song2], @room1.songs)
  end

  def test_check_guest_into_room_when_room_full
    assert_equal("Room 3 is full, Fred cannot be checked in.", @room3.check_in(@guest1))
  end

  def test_guest_cheer__happy
    assert_equal("Whoo", @guest2.cheer(@room2))
  end

  def test_guest_cheer__sad
    assert_equal("Aww", @guest1.cheer(@room2))
  end

  def test_guest_can_order_drink
    @guest1.order_drink(@drink1, @room2)
    assert_equal(10, @room2.get_tab)
  end

  def test_guest_can_order_food
    @guest1.order_food(@food1, @room2)
    assert_equal(4, @room2.get_tab)
  end

  def test_get_total_cash_of_guests
    assert_equal(80, @room3.get_total_cash_of_guests)
  end
end
