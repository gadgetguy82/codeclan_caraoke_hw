class KaraokeVenue
  attr_reader :name, :rooms, :entry_fee

  def initialize(name, rooms, entry_fee)
    @name = name
    @rooms = rooms
    @entry_fee = entry_fee
  end

  def add_room(room)
    if room.is_a?(Array)
      @rooms += room
    else
      @rooms << room
    end
  end
end
