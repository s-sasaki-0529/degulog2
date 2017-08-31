class Api::TweetsController < Api::ApplicationController

  #
  # ツイートの一覧を取得
  #
  def index
    params[:latest] and Tweet.synchronize
    render json: Tweet.order(datetime: :desc), each_serializer: TweetSerializer
  end

end
