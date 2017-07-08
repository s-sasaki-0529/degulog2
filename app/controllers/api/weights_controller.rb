class Api::WeightsController < Api::ApplicationController

  # 体重の一覧を取得
  #------------------------------------
  def index
    render json: Weight.all, each_serializer: Api::WeightSerializer
  end

  # デグーを新規作成
  #------------------------------------
  def create

  end

  # デグーを更新
  #------------------------------------
  def update

  end

  # デグーを削除
  #------------------------------------
  def destroy

  end

end
