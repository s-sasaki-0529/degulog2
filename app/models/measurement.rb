class Measurement < ApplicationRecord
  has_many :weights, dependent: :destroy

  #
  # 体重記録作成後、既に同日のレコードがある場合、最新の以外削除する
  #
  after_create do
    dup_measurements = Measurement.where(date: self.date).where.not(id: self.id)
    dup_measurements.destroy_all if dup_measurements.present?
  end
end
