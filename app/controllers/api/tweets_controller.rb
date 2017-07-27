class Api::TweetsController < Api::ApplicationController

  # ツイートの一覧を取得
  #------------------------------------
  def index
    render json: Tweet.all
  end

end
