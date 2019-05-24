class BarTab
  attr_reader :tab

  def initialize
    @tab = 0
  end

  def add_to_bar_tab(amount)
    @tab += amount
  end
end
