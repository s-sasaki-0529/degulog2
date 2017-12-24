class Degu < ApplicationRecord
  has_many :weights
  has_many :measurements, through: :weights
  enum gender: { male: 0, female: 1, unknown: 2 }

  #
  # 現在の体重
  # やり方が遠回しでやや重い
  #
  def current_weight
    last_measurement_id = self.measurements.order(date: :desc).first&.id
    if last_measurement_id
      self.weights.find_by(measurement_id: last_measurement_id)&.value
    else
      0
    end
  end
end
