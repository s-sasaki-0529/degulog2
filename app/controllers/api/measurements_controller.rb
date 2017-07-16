class Api::MeasurementsController < Api::ApplicationController

  # 体重測定の一覧を取得
  #------------------------------------
  def index
    render json: Measurement.all
  end

end
