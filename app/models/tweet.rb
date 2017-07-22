class Tweet < ApplicationRecord
  has_many :picture

  # TwitterAPIを用いて同期
  def self.synchronize
    tl = Twitter.new.timeline
    self.transaction do
      self.delete_all
      self.create(tl)
    end
  end

end
