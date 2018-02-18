RSpec.describe Tweet, type: :model do
  describe 'class method' do
    #
    # Tweet.synchronize
    # TwitterAPIを用いて、レコードを最新の状態にする
    #
    describe 'synchronize' do
      let(:mock_tweets) do
        [
          {origin_id: 123456789, text: 'tweet1', like_count: 10, retweet_count: 10},
          {origin_id: 234567891, text: 'tweet2', like_count: 20, retweet_count: 5},
          {origin_id: 345678901, text: 'tweet3', like_count: 30, retweet_count: 3},
        ]
      end
      let(:mock_pictures_url) do
         ['hoge.jpg', 'fuga.jpg']
      end
      before do
        #
        # mock Twitter#timeline
        #
        allow_any_instance_of(Twitter)
          .to receive(:timeline)
          .and_return(mock_tweets)
        #
        # mock Twitter#get_pictures_url
        #
        allow_any_instance_of(Twitter)
          .to receive(:get_pictures_url)
          .and_return(mock_pictures_url)
      end
      context 'Tweetレコードが空の場合' do
        before do
          Tweet.synchronize
        end
        it '取得したツイート数分レコードが作成される' do
          expect(Tweet.count).to eq 3
        end
        it '関連するPicturesレコードが作成される' do
          expect(Tweet.first.pictures.count).to eq 2
          expect(Tweet.first.pictures.first.url).to eq 'hoge.jpg'
        end
      end
      context '既にTweetレコードがある場合' do
        before do
          Tweet.create(origin_id: 123456789, like_count: 5)
          Tweet.synchronize
        end
        it '既存のツイートは上書き更新される' do
          expect(Tweet.count).to eq 3
          expect(Tweet.find_by(origin_id: 123456789).like_count).to eq 10
          expect(Tweet.find_by(origin_id: 123456789).pictures.count).to eq 2
        end
      end

    end

  end
end
