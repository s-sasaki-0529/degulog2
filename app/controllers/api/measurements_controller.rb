class Api::MeasurementsController < Api::ApplicationController

  #
  # 体重測定の一覧を取得
  # 関連するweightsもまとめて返却する
  #
  def index
    render json: Measurement.order(date: :desc)
  end

  #
  # 体重測定記録を作成
  # 関連するweightsもまとめて作成する
  #
  def create
    @measurement = Measurement.create(measurement_params).weights.create(weights_params[:weights])
    if @measurement
      head :created
    end
  end

  private

    def measurement_params
      params.permit(:date)
    end

    def weights_params
      params.permit(weights: [:degu_id, :value])
    end

end
