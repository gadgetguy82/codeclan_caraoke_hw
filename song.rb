class Song
  attr_reader :title, :lyrics

  def initialize(title, lyrics = "Verse, chorus")
    @title = title
    @lyrics = lyrics
  end
end
