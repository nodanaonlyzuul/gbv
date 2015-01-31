class Gbv::SongFetcher
  require 'httparty'
  require 'uri'
  require 'nokogiri'
  require 'song'

  # This, ladies and gentlemen, is weird, programatic code at its worst
  def self.fetch_song(title)
    begin
      response = HTTParty.get(song_url(title))

      if response.body.include?("No data found")
        search_response = HTTParty.get(search_url(title))
        song_node       = Nokogiri::HTML(search_response).css("td a").find_all {|a| a['href'].include? "all=true" }.first
        song = Song.new(Nokogiri::HTML(HTTParty.get(song_url(song_node.inner_text))))
      else
        song = Song.new(Nokogiri::HTML(response))
      end

      song
    rescue Exception => e
      return "Something went wrong. This thing is finicky about spelling. I'm not a scientist."
    end
  end

private

  def self.song_url(title)
    "http://gbvdb.com/track.asp?track=#{URI.encode(title)}&version=&live=False"
  end

  def self.search_url(title)
    "http://gbvdb.com/tracks.asp?song_title=#{URI.encode(title)}"
  end

end