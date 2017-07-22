class Api::BoughtsController < Api::ApplicationController

  # 購入履歴の一覧を取得
  #------------------------------------
  def index
    render json: Bought.order(date: :desc)
  end

end
