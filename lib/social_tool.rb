module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.user_timeline("ThomasAJBanys").collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end


    # client.user_timeline("theroyalballet")


    # def client.get_all_tweets(user)
    #   options = {:count => 3, :include_rts => true}
    #   user_timeline(user, options)
    # end
