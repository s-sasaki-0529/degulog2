class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :date, :weights

  #
  # 計測簿をフォーマットした文字列
  #
  def date
    object.date.strftime('%Y/%m/%d')
  end

  #
  # デグーIDごとの体重記録
  # weightsモデルに依存するので注意
  #
  def weights
    weights_hash  = {}
    object.weights.each do |o|
      weights_hash[o.degu_id] = o.value
    end
    weights_hash
  end
end
