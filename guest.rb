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
end
