  tweets = ["#promo Eu sigo o @trilhacultural e quero ganhar o CD @LeoAzorra #Unplugged. RT e concorra http://kingo.to/rIf @FDP"]
  
  def get_promoters(tweets)
    captures = []
    tweets.each do |tweet|
      captures = tweet.scan(/(@[a-zA-Z]+)/)
    end
    captures
  end
