require "open-uri"
module Promote
  def get_promoters(tweets)
    captures = []
    tweets.each do |tweet|
      captures = tweet.scan(/(@[a-zA-Z]+)/)
    end
    captures
  end



def twitter_search(query)
  JSON.parse(open("http://search.twitter.com/search.json?q=#{CGI.escape(query)}").read)
end

  
end