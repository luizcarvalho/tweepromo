class PromovesController < ApplicationController
 before_filter :admin_required
  def index
  end

  def postar
    @global_result = []
    tweets = params["tweet"]
    tweets.delete("")
    tweets.each do |tweet|
      @global_result.push(User.tweet_this(tweet))
    end
  end


  def seguir
    @global_result = []
    nicks = params["nick"]
    nicks.delete("")
     nicks.each do |nick|
      @global_result.push(@result = User.follow_him(nick))
    end
  end


  
end
