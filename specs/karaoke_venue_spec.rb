require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_venue')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class KaraokeVenueTest < Minitest::Test

  def setup
    @room1 = Room.new(1, 10)
    @room2 = Room.new(2, 15)
    @room3 = Room.new(3, 3)

    @rooms = [@room1, @room2, @room3]
    @venue1 = KaraokeVenue.new("Ace Karaoke", @rooms, 20)
    @venue2 = KaraokeVenue.new("Karaoke Cave", [], 10)
  end

  def test_get_venue_name
    assert_equal("Ace Karaoke", @venue1.name)
  end

  def test_get_room_list_from_venue
    assert_equal(@rooms, @venue1.rooms)
  end

  def test_add_room_to_venue
    @venue2.add_room(@room1)
    @venue2.add_room(@room2)
    assert_equal([@room1, @room2], @venue2.rooms)
  end
end
