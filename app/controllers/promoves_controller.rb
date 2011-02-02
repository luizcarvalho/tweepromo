class PromovesController < ApplicationController
  include Promote
 before_filter :admin_required
  def index
    @tweet = params["tweet"]
    @promoters = get_promoters(@tweet)
    @count = params["count"]
    @max = User.count
  end

  def postar
    
    @tweet = params["tweet"]
    @count = (params["count"] || 0).to_i
    #@promoters = get_promoters(@tweet)
    @max = User.count
    result = User.tweet_this(@tweet, @count)
    result_tag = result.collect { |nick,r| "<li>#{nick} - #{r}</li>"  }
    
    
    respond_to do |format|
      format.html {render :text=>(@count>@max) ? "done" : result_tag.to_s ,:layout=>false}
      format.json
      format.js
    end
    
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
