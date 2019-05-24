require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < Minitest::Test

  def setup
    @room1 = Room.new(1)
    @room2 = Room.new(2)
    @guest1 = Guest.new("Fred")
    @guest2 = Guest.new("Kim")
    @guest3 = Guest.new("Rachel")
    @guest4 = Guest.new("Victor")
    @song1 = Song.new("Perfect Day")
    @song2 = Song.new("Uptown Girl")

    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    @room2.check_in(@guest3)
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
    assert_equal("Victor is not in this room", @room2.check_out(@guest4))
  end

  def test_add_song_to_room
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal([@song1, @song2], @room1.songs)
  end
end
