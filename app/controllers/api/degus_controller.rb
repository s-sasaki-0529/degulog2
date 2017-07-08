class Api::DegusController < Api::ApplicationController

  # デグーの一覧を取得
  #------------------------------------
  def index
    render json: Degu.all, each_serializer: Api::DeguSerializer
  end

  # デグーの詳細を取得
  #------------------------------------
  def show
    render json: Degu.find(params['id']), serializer: Api::DeguSerializer
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
