require 'twitter_oauth'
require 'net/http'
require 'uri'

class Twitter

  @@SCREEN_NAME = 'housoup'
  @@KEY_WORD    = '#デグー'
  @@URLBASE     = "https://twitter.com/HousouP/status/"
  @@SLEEP_TIME = 1

  #
  # TwitterAPIの認証を行う
  #
  def auth
    @twitter = TwitterOAuth::Client.new(
      :consumer_key    => ENV['TWITTER_API_KEY'],
      :consumer_secret => ENV['TWITTER_API_SECRET'],
    )
  puts "Twitter APIの認証完了"
  end

  #
  # 自身のツイート一覧を再帰的に取得する
  # 取得したツイートから、#デグーが含まれているもののみ抽出し、整形して戻す
  #
  def timeline(limit = 200, opt = {})
    @twitter or self.auth
    puts "^^^^^^^^^^^^^^^^^^^ツイートの取得 残り:#{limit}^^^^^^^^^^^^^^^^"
    params = {
      screen_name:     @@SCREEN_NAME,
      count:           limit,
      trim_user:       true,
      exclude_replies: true,
      include_rts:     false,
      tweet_mode:      :extended
    }.merge(opt)
    tweets = @twitter.user_timeline(params)
    degu_tweets = tweets.select {|t| t['full_text'].index(@@KEY_WORD)}.map {|t| parse(t)}
    limit -= tweets.count
    if tweets.count > 1 && limit > 0
      max_id = tweets[-1]['id_str']
      degu_tweets.concat self.timeline(limit, max_id: max_id)
    else
      return degu_tweets
    end
  end

  #
  # 検索ワードに合致するツイート一覧を取得
  #
  def search_pictures(word, num = 10, opt = {})
    @twitter or self.auth
    params = {
      lang:        'ja',
      locale:      'ja',
      result_type: 'mixed',
      count:       200,
    }.merge(opt)
    puts "画像検索中(残り#{num}枚)"

    tweets = @twitter.search(word, params)['statuses']
    max_id = tweets[-1]['id']
    pictures = extract_pictures_from_tweets(tweets)

    if num <= pictures.count
      return pictures.take(num)
    else
      sleep @@SLEEP_TIME
      return pictures.concat self.search_pictures(word, num - pictures.count, max_id: max_id)
    end
  end

  #
  # ツイッター上の画像をまとめてダウンロードする
  #
  def download_pictures(word, download_dir, num = 10)
    pictures = self.search_pictures(word, num)
    pictures.each_with_index do |picture, idx|
      filename = File.basename(picture)
      filepath = "#{download_dir}/#{filename}"
      open(filepath, 'wb') do |file|
        puts "downloading(#{idx + 1}/#{pictures.count}): #{picture}"
        file.puts(Net::HTTP.get_response(URI.parse(picture)).body)
      end
      sleep @@SLEEP_TIME
    end
  end

  #
  # ツイートの元ページを参照し、レスポンス内に含まれる画像のURLを戻す
  #
  def get_pictures_url(tweet_origin_id)
    uri = URI.parse(@@URLBASE + tweet_origin_id)
    res = Net::HTTP.get_response(uri)
    pictures = res.body.scan(/data-image-url="(.+)"$/).map {|i| i[0]}
    puts "添付画像のURLを取得"
    puts pictures
    return pictures
  end

  private

    #
    # TwitterAPIで取得したツイートを整形する
    #
    def parse(tweet)
      {
        origin_id:     tweet['id'],
        text:          tweet['full_text'].gsub("\n", '').gsub(/https:.+? *$/, ''),
        like_count:    tweet['favorite_count'],
        retweet_count: tweet['retweet_count'],
        datetime:      tweet['created_at'],
      }
    end

    #
    # TwitterAPIで取得したツイート一覧からmedia情報を抜き取る
    #
    def extract_pictures_from_tweets(tweets)
      pictures = tweets.map do |t|
        if media = t['entities']['media']
          media.map {|m| m['media_url']}
        else
          []
        end
      end
      pictures.flatten.uniq
    end

end
