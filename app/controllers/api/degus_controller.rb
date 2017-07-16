class Api::DegusController < Api::ApplicationController

  # デグーの一覧を取得
  #------------------------------------
  def index
    render json: Degu.order(:died_date)
  end

  # デグーの詳細を取得
  #------------------------------------
  def show
    render json: Degu.find(params['id'])
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
