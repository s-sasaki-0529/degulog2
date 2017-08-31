class Api::DegusController < Api::ApplicationController

  #
  # 一覧
  #
  def index
    order = params[:order] || 'id'
    render json: Degu.order(order)
  end

  #
  # 詳細
  #
  def show
    render json: Degu.find(params['id'])
  end

end
