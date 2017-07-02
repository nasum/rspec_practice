require 'twitter'

class WeatherBot
  def search_first_weather_tweet
    twitter_client.search('天気').first.text
  end

  def tweet_forecast
    twitter_client.update '今日は晴れです'
  rescue => e
    notify(e)
  end

  def twitter_client
    Twitter::Rest::Clietn.new
  end

  def notify(e)
    puts e
  end
end
