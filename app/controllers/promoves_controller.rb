class PromovesController < ApplicationController
  include Promote
 before_filter :admin_required
  def index
  end

  def postar
    @global_result = []
    @tweet = params["tweet"]
    @count = (params["count"] || 0).to_i
    #@tweets.delete("")
    @promoters = get_promoters(@tweet)
    #@tweets.each do |tweet|
      @global_result.push(User.tweet_this(@tweet,@count))
    #end
  end


  def seguir
    @global_result = []
    @nicks = params["nick"]

    @nicks.delete("")
     @nicks.each do |nick|
      @global_result.push(@result = User.follow_him(nick))
    end
  end

  def promocoes
    @searches = twitter_search("kingo")['results']
    @searches
  end

  
end
