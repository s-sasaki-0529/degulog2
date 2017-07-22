require 'twitter_oauth'
class Twitter

  @@SLEEP_TIME = 2

  # initialize - インスタンスを生成する
  #---------------------------------------------------------------------
  def initialize
    @twitter = TwitterOAuth::Client.new(
      :consumer_key    => ENV['TWITTER_API_KEY'],
      :consumer_secret => ENV['TWITTER_API_SECRET'],
      :token           => ENV['TWITTER_ACCESS_TOKEN'],
      :secret          => ENV['TWITTER_ACCESS_SECRET'],
    )
  end

end
