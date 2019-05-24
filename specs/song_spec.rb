require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < Minitest::Test

  def setup
    @song1 = Song.new("Eye of the Tiger")
  end

  def test_get_song_name
    assert_equal("Eye of the Tiger", @song1.title)
  end
end
