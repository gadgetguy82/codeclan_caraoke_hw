class Till
  attr_reader :cash_flow

  def initialize(cash_flow)
    @cash_flow = cash_flow
  end

  def add_sale(amount)
    @cash_flow += amount
  end
end
