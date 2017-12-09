class DeguSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :birthday, :come_date, :died_date, :is_alive, :age, :current_weight, :picture_url

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
    days = (Date.today - object.birthday).to_i
    year = days / 356
    month = (days % 365) / 30
    %(#{year}歳#{month}ヶ月)
  end

  # お別れ日
  def died_date
    object.died_date&.strftime('%Y年%m月%d日')
  end

  # 写真
  def picture_url
    object.picture_url ? object.picture_url : ''
  end

end
