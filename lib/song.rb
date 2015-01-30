require 'ostruct'

class Song

  attr_reader :lyrics

  def initialize(nokogiriDoc)
    @lyrics = nokogiriDoc.css("textarea")[0].inner_text
  end

end