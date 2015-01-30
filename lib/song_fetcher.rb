class Gbv::SongFetcher
  require 'httparty'
  require 'uri'
  require 'nokogiri'

  def self.fetch_song(title)
    url = "http://www.gbvdb.com/track.asp?track=#{URI.encode(title)}&version=&live=False"
    response = HTTParty.get(url)

    if response.code == 200
      document = Nokogiri::HTML(response)
      lyrics = document.css("textarea")[0].inner_text
      lyrics
    end

  end
end