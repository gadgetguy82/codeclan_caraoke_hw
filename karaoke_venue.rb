require_relative('./till')

class KaraokeVenue
  attr_reader :name, :rooms, :entry_fee, :till

  def initialize(name, rooms, entry_fee, start_cash)
    @name = name
    @rooms = rooms
    @entry_fee = entry_fee
    @till = Till.new(start_cash)
  end

  def add_room(room)
    if room.is_a?(Array)
      @rooms += room
    else
      @rooms << room
    end
  end

  def add_entry_fee_to_bar_tab_of_room(room)
    room.add_to_bar_tab(@entry_fee)
  end
end
