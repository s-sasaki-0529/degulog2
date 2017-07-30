class Api::BoughtsController < Api::ApplicationController

  # 購入履歴の一覧を取得
  #------------------------------------
  def index
    params[:latest] and Bought.synchronize
    render json: Bought.order(date: :desc)
  end

end
