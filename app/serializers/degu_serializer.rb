class Api::DeguSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :birthday, :come_date, :died_date, :is_alive, :age, :weight

  # 生存中か
  def is_alive
    !object.died_date
  end

  # 性別
  def sex
    object.is_male ? 'オス' : 'メス'
  end

  # 年齢(or享年)
  def age
    date = is_alive ? Date.today : object.died_date
    days = (date - object.birthday).to_i
    year = days / 356
    month = (days % 365) / 30
    %(#{year}歳#{month}ヶ月)
  end

  # 現在の体重
  def weight
    object.weights.order(date: :desc).first.value
  end

end
