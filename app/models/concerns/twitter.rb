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

  def timeline(limit = 200, opt = {})
    p "^^^^^^^^^^^^^^^^^^^timeline #{limit}^^^^^^^^^^^^^^^^"
    params = {
      screen_name:     @@SCREEN_NAME,
      count:           limit,
      trim_user:       true,
      exclude_replies: true,
      include_rts:     false,
    }.merge(opt)
    tweets = @twitter.user_timeline(params)
    degu_tweets = tweets.select {|t| t['text'].index(@@KEY_WORD)}.map {|t| parse(t)}

    limit -= tweets.count
    if tweets.count > 1 && limit > 0
      max_id = tweets[-1]['id_str']
      degu_tweets.concat self.timeline(limit, max_id: max_id)
    else
      return degu_tweets
    end
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
