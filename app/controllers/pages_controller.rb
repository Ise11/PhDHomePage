class PagesController < ApplicationController

  def home
  end

  def about
  end

  def contact
  end

  def news
    @tweets = SocialTool.twitter_search
    # @tweet_news = SocialTool.get_all_tweets("theroyalballet")
  end
end
