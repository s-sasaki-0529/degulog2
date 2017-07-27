class TweetSerializer < ActiveModel::Serializer
  attributes :origin_id, :text, :like_count, :retweet_count, :date

  def date
    object.datetime.to_date.to_s
  end

 end
