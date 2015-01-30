require "gbv/version"
require "song_fetcher"

module Gbv

  def self.fetch_song(title)
    @song_fetcher = SongFetcher.fetch_song(title)
    @song_fetcher
  end

end


