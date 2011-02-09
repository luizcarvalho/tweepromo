class PromovesController < ApplicationController
  include Promote
 before_filter :admin_required
  def index
    @tweet = params["tweet"]
    @tweeturl = @tweet
    @nick = params["nick"]
    @promoters = get_promoters(@tweet) if @tweet
    @count = params["count"]
    @max = User.count
  end

  def postar
    
    @tweet = params["tweet"]
    @count = (params["count"] || 0).to_i
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
    @nick = params["nick"]
    @count = (params["count"] || 0).to_i
    @max = User.count
    result = User.follow_him(@nick,@count)
    result_tag = result.collect { |nick,r| "<li>#{nick} - #{r}</li>"  }
    
    respond_to do |format|
      format.html {render :text=>(@count>@max) ? "done" : result_tag.to_s ,:layout=>false}
      format.json
      format.js
    end

  end

  def promocoes
    @searches = twitter_search("kingo")['results']
    @searches
  end

  
end
