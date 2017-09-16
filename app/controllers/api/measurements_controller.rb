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
  # 既に同日のレコードがある場合、一度削除する
  #
  def create
    @measurement = Measurement.create(measurement_params)
    if @measurement
      @measurement.weights.create(weights_params[:weights])
      render json: @measurement
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
