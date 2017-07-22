class Tweet < ApplicationRecord
  has_many :picture

  # TwitterAPIを用いて同期
  def self.synchronize
    tl = Twitter.new.timeline
    self.transaction do
      tl.each do |t|
        self.find_or_initialize_by(origin_id: t[:origin_id]).update(t)
      end
    end
  end

end
