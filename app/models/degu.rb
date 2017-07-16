class Degu < ApplicationRecord
  has_one :picture
  has_many :weights
  has_many :measurements, through: :weights

  # 現在の体重
  # やり方が遠回しでやや重い
  def current_weight
    last_measurement_id = self.measurements.order(date: :desc).first.id
    self.weights.find_by(measurement_id: last_measurement_id).value
  end
end
