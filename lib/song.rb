require 'ostruct'

class Song

  attr_accessor :lyrics
  attr_accessor :title

  def initialize(nokogiriDoc)
    if nokogiriDoc
      @lyrics = nokogiriDoc.css("textarea")[0].inner_text
      @title  = nokogiriDoc.css("h2")[0].inner_text
    end
  end

end