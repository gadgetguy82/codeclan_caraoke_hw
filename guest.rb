class Guest
  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, song)
    @name = name
    @wallet = wallet
    @favourite_song = song
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
    if room.bar_tab.tab + drink.price <= @wallet
      room.add_to_bar_tab(drink.price)
    end
  end

  # buy_drink immediately pays for drink
  def buy_drink(drink)
    if drink.price <= @wallet
      @wallet -= drink.price
    end
  end

  def sing_song(song)
    
  end
end
