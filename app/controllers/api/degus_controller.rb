class Api::DegusController < Api::ApplicationController
  #
  # 一覧
  #
  def index
    degus = Degu.all

    # 並び順を指定
    degus = degus.order(params[:order]) if params[:order]

    # 現在も有効なデグーのみに絞り込み
    degus = degus.valid if params[:valid]

    # 無効なデグーのみに絞り込み
    degus = degus.invalid if params[:invalid]

    render json: degus
  end

  #
  # 詳細
  #
  def show
    render json: Degu.find(params['id'])
  end
end
