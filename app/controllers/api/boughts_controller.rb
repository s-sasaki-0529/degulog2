class Api::BoughtsController < Api::ApplicationController

  # 購入履歴の一覧を取得
  #------------------------------------
  def index
    params[:latest] and Bought.synchronize
    if params[:monthly]
      render json: Bought.monthly_amounts
    else
      render json: Bought.order(date: :desc)
    end
  end

end
