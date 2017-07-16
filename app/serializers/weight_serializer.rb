class WeightSerializer < ActiveModel::Serializer
  attributes :id, :degu_id, :degu_name, :value

  # 関連するデグーの名前
  def degu_name
    object.degu.name
  end

end
