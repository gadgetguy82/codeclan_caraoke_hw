require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_venue')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class KaraokeVenueTest < Minitest::Test

  def setup
    @song1 = Song.new("Welcome to the Jungle")
    @song2 = Song.new("Highway to Hell")
    @room1 = Room.new(1, 10)
    @room2 = Room.new(2, 15)
    @room3 = Room.new(3, 3)

    @rooms = [@room1, @room2, @room3]
    @venue1 = KaraokeVenue.new("Ace Karaoke", @rooms, 20, 500)
    @venue2 = KaraokeVenue.new("Karaoke Cave", [], 10, 300)

    @guest1 = Guest.new("Harry", 100, @song1)
    @guest2 = Guest.new("Danny", 200, @song2)

    @room2.check_in(@guest1)
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

  def test_add_entry_fee_to_tab_of_room
    @venue1.add_entry_fee_to_bar_tab_of_room(@venue1.rooms[1])
    assert_equal(20, @venue1.rooms[1].get_tab)
  end

  def test_settle_tab
    @venue1.add_entry_fee_to_bar_tab_of_room(@venue1.rooms[1])
    @venue1.rooms[1].settle_tab(@venue1.till)
    assert_equal(520, @venue1.till.cash_flow)
  end
end
