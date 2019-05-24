class Guest
  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def pay_fee(amount)
    if amount <= @wallet
      @wallet -= amount
    else
      return "#{@name} cannot pay entry fee"
    end
  end
end
