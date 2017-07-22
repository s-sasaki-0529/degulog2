require 'twitter_oauth'
class Twitter

  @@SCREEN_NAME = 'housoup'
  @@KEY_WORD    = '#デグー'
  @@SLEEP_TIME = 2

  # initialize - インスタンスを生成する
  #---------------------------------------------------------------------
  def initialize
    @twitter = TwitterOAuth::Client.new(
      :consumer_key    => ENV['TWITTER_API_KEY'],
      :consumer_secret => ENV['TWITTER_API_SECRET'],
    )
  end

  def timeline
    params = {
      screen_name:     @@SCREEN_NAME,
      count:           200,
      trim_user:       true,
      exclude_replies: true,
      include_rts:     false,
    }
    tl = @twitter.user_timeline(params).select {|t| t['text'].index(@@KEY_WORD)}
    tl.map {|t| parse(t)}
  end

  private

    def parse(tweet)
      {
        origin_id:     tweet['id'],
        text:          tweet['text'].gsub("\n", '').gsub(/https:.+? *$/, ''),
        like_count:    tweet['favorite_count'],
        retweet_count: tweet['retweet_count'],
        datetime:      tweet['created_at'],
      }
    end

end
