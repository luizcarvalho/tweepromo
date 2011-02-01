class User < TwitterAuth::GenericUser
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.
    def self.tweet_this(tweet,offset)
      result = {}
      User.find(:all,:offset=>offset,:limit=>5).each do |user|
        begin
          user.twitter.post('/statuses/update.json', 'status' =>tweet)
          result.store(user.login,"Enviado")
        rescue Exception => e
          result.store(user.login,"ERRO: #{e.message}")
        end
      end
      result
    end


    def self.follow_him(nick)
      result = {}
      User.all.each do |user|
        begin
          user.twitter.post("/friendships/create/#{nick}.json")
          result.store(user.login,"Seguindo")
        rescue Exception => e
          result.store(user.login,"ERRO: #{e.message}")
        end
      end
      result
    end

end
