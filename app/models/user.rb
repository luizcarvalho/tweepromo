class User < TwitterAuth::GenericUser
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.
    def self.tweet_this(tweet)
      result = {}
      User.all.each do |user|
        begin
          user.twitter.post('/statuses/update.json', 'status' =>tweet)
          result.store(user.login,true)
        #rescue
          result.store(user.login,false)
        end
      end
    end


    def self.follow_him(nick)
      result = {}
      User.all.each do |user|
        begin
          user.twitter.post("/friendships/create/#{nick}.json")
          result.store(user.login,true)
        rescue
          result.store(user.login,false)
        end
      end
    end


end
