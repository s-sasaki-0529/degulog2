class TweetSerializer < ActiveModel::Serializer
  attributes :origin_id, :text, :like_count, :retweet_count, :datetime, :date
  has_many :pictures

  def pictures
    object.pictures.pluck(:url)
  end

  def date
    object.datetime.to_date.to_s
  end

 end
