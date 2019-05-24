class Guest
  attr_reader :name, :wallet, :drunk_level

  def initialize(name, wallet, song)
    @name = name
    @wallet = wallet
    @favourite_song = song
    @drunk_level = 0
  end

  def pay_fee(amount)
    if amount <= @wallet
      @wallet -= amount
    else
      return "#{@name} cannot pay entry fee"
    end
  end

  def cheer(room)
    if room.songs.include?(@favourite_song)
      return "Whoo"
    else
      return "Aww"
    end
  end

  # order_drink will only add the drink price to the room's bar_tab
  def order_drink(drink, room)
    if room.get_tab + drink.price <= @wallet
      room.add_to_bar_tab(drink.price)
      @drunk_level += drink.alcohol_level
    end
  end

  # buy_drink immediately pays for drink
  def buy_drink(drink)
    if drink.price <= @wallet
      @wallet -= drink.price
      @drunk_level += drink.alcohol_level
    end
  end

  def sing_song(song)
    if @drunk_level > 5
      slur_song(song)
    else
      return song.lyrics
    end
  end

  def slur_song(song)
    slurred_lyrics = song.lyrics
    (1 + rand(@drunk_level)).times do
      random_letter = ('a'..'z').to_a[rand(26)]
      slurred_letter = (1 + rand(@drunk_level)).times.map {random_letter}.join
      slurred_lyrics.sub!(random_letter, slurred_letter)
    end
    return slurred_lyrics
  end
end
