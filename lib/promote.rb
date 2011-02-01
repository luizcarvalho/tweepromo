require "open-uri"
module Promote
  def get_promoters(tweet)
    captures = []
    #tweets.each do |tweet|
      captures = tweet.scan(/(@\S+)/)
    #end
    captures
  end



def twitter_search(query)
  JSON.parse(open("http://search.twitter.com/search.json?q=#{CGI.escape(query)}").read)
end

  
end