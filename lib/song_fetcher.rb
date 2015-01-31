class Gbv::SongFetcher
  require 'httparty'
  require 'uri'
  require 'nokogiri'
  require 'song'

  def self.fetch_song(title)
    url = "http://www.gbvdb.com/track.asp?track=#{URI.encode(title)}&version=&live=False"
    response = HTTParty.get(url)

    if response.code == 200
      return "No song found. Check your title. This app has bad correction." if response.body.include?("No data found")
      song = Song.new(Nokogiri::HTML(response))
      song.lyrics
    end

  end
end