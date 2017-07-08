class Degu < ApplicationRecord
  has_one :picture
  has_many :weights
end
