require 'spec_helper'
require './models/weather_bot.rb'

RSpec.describe 'mock' do
  it 'エラーなく予報をツイートすること' do
    twitter_client_mock = double('Twitter Client')
    expect(twitter_client_mock).to receive(:update)

    weather_bot = WeatherBot.new
    allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)

    expect{ weather_bot.tweet_forecast }.not_to raise_error
  end

  it 'エラーが起きたら通知すること' do
    twitter_client_mock = double('Twitter Clietn')
    allow(twitter_client_mock).to receive(:update).and_raise('エラーが発生しました')

    weather_bot = WeatherBot.new
    allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)

    expect(weather_bot).to receive(:notify)

    weather_bot.tweet_forecast
  end

  it 'エラー無く予報をツイートすること' do
    twitter_client_mock = double('Twitter Client')
    allow(twitter_client_mock).to receive(:update)

    allow_any_instance_of(WeatherBot).to receive(:twitter_client).and_return(twitter_client_mock)

    weather_bot = WeatherBot.new
    expect{ weather_bot.tweet_forecast }.not_to raise_error
  end

  it '「天気」を含むツイートを返すこと' do
    status_mock = double('Status')
    allow(status_mock).to receive(:text).and_return('新宿の天気は曇りです')

    twitter_client_mock = double('Twitter Client')
    allow(twitter_client_mock).to receive(:search).and_return([status_mock])

    weather_bot = WeatherBot.new
    allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)

    expect(weather_bot.search_first_weather_tweet).to eq '新宿の天気は曇りです'
  end

  it '「天気」を含むツイートを返すこと' do
    weather_bot = WeatherBot.new
    allow(weather_bot).to receive_message_chain('twitter_client.search.first.text').and_return('新宿区の天気は曇りです')

    expect(weather_bot.search_first_weather_tweet).to eq '新宿区の天気は曇りです'
  end

  it 'エラー無く予報をツイートすること' do
    twitter_client_mock = double('Twitter Client').as_null_object

    weather_bot = WeatherBot.new
    allow(weather_bot).to receive(:twitter_client).and_return(twitter_client_mock)

    expect{ weather_bot.tweet_forecast }.not_to raise_error
  end
end
