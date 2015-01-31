require 'ostruct'

class Song

  attr_accessor :lyrics


  def initialize(nokogiriDoc)
    @lyrics = nokogiriDoc.css("textarea")[0].inner_text if nokogiriDoc
  end

end