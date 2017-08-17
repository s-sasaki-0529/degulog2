class DeguSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :birthday, :come_date, :died_date, :is_alive, :age, :current_weight, :picture

  # 生存中か
  def is_alive
    !object.died_date
  end

  # 性別
  def gender
    {
      'male'    => 'オス',
      'female'  => 'メス',
      'unknown' => '不明',
    }[object.gender]
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

  # 写真
  def picture
    object.picture ? object.picture.url : ''
  end

end
