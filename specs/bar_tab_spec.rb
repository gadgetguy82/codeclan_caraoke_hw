require('minitest/autorun')
require('minitest/rg')
require_relative('../bar_tab')

class BarTabTest < Minitest::Test

  def setup
    @bar_tab = BarTab.new
  end

  def test_get_bar_tab
    assert_equal(0, @bar_tab.tab)
  end

  def test_add_to_bar_tab
    assert_equal(20, @bar_tab.add_to_bar_tab(20))
  end
end
