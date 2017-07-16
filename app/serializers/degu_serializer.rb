class DeguSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :birthday, :come_date, :died_date, :is_alive, :age, :current_weight

  # 生存中か
  def is_alive
    !object.died_date
  end

  # 性別
  def sex
    object.is_male ? 'オス' : 'メス'
  end

  # 誕生日 日を省略
  def birthday
    %(#{object.birthday.year}年#{object.birthday.month}月)
  end

  # 年齢(or享年)
  def age
    date = is_alive ? Date.today : object.died_date
    days = (date - object.birthday).to_i
    year = days / 356
    month = (days % 365) / 30
    if is_alive
      %(#{year}歳#{month}ヶ月)
    else
      %(#{year}歳#{month}ヶ月)
    end
  end

end
