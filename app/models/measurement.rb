class Measurement < ApplicationRecord
  has_many :weights, dependent: :destroy

  #
  # 体重記録作成時、既に同日のレコードがある場合、最新の以外削除する
  #
  after_create do
    dup_measurements = Measurement.where(date: self.date).where.not(id: self.id)
    if dup_measurements.present?
      dup_measurements.destroy_all
    end
  end

end
