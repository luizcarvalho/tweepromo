class PromovesController < ApplicationController

  def index
  end

  def postar
    tweets = params["tweet"]
    tweets.delete("")
    tweets.each do |tweet|
      @result = User.tweet_this(tweet)
    end
  end


  def seguir
    nicks = params["nick"]
    nicks.delete("")
     nicks.each do |nick|
      @result = User.follow_him(nick)
    end
  end
end
