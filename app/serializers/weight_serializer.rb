class Api::WeightSerializer < ActiveModel::Serializer
  attributes :id, :degu_name, :date, :value

  # 関連するデグーの名前
  def degu_name
    object.degu.name
  end

end
