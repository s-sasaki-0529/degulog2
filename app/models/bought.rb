class Bought < ApplicationRecord

  # ZaimAPIを用いてテーブルを最新の状態にする
  def self.synchronize
    api_response = Zaim.new.getPetsPayments
    boughts = api_response.map do |r| 
      {
        amount:  r['amount'],
        comment: r['comment'],
        place:   r['place'],
        date:    r['date'],
      }
    end
    self.transaction do
      self.delete_all
      self.create(boughts)
    end
  end

end
