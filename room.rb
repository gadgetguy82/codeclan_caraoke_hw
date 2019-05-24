class Room
  attr_reader :number, :guests, :songs

  def initialize(number)
    @number = number
    @guests = []
    @songs = []
  end

  def check_in(guest)
    @guests << guest
  end

  def check_out(guest)
    if @guests.include?(guest)
      @guests.delete(guest)
    else
      return "#{guest.name} is not in this room"
    end
  end

  def add_song(song)
    @songs << song
  end
end
