class Song
  attr_reader :title, :lyrics

  def initialize(title, lyrics = "Verse, Chorus")
    @title = title
    @lyrics = lyrics
  end
end
