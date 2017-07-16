class MeasurementSerializer < ActiveModel::Serializer
  attributes :date
  has_many :weights
end
