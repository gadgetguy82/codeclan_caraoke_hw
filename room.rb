require_relative('./bar_tab')

class Room
  attr_reader :number, :guests, :songs

  def initialize(number, capacity)
    @number = number
    @guests = []
    @songs = []
    @capacity = capacity
    @bar_tab = BarTab.new
  end

  def check_in(guest)
    if @guests.length < @capacity
      @guests << guest
    else
      return "Room #{@number} is full, #{guest.name} cannot be checked in."
    end
  end

  def check_out(guest)
    if @guests.include?(guest)
      @guests.delete(guest)
    else
      return "#{guest.name} is not in room #{@number}"
    end
  end

  def add_song(song)
    if song.is_a?(Array)
      @songs += song
    else
      @songs << song
    end
  end

  def get_tab
    return @bar_tab.tab
  end

  def add_to_bar_tab(amount)
    @bar_tab.add_to_bar_tab(amount)
  end
end
