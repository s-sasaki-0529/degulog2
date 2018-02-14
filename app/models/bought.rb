class Bought < ApplicationRecord
  #
  # ZaimAPIを用いてテーブルを最新の状態にする
  #
  def self.synchronize
    api_response = Zaim.new.fetch_pets_payments
    bank_merged_date = Date.new(2017, 10, 1)
    boughts = api_response.map do |r|
      {
        amount:  Date.parse(r['date']) < bank_merged_date ? r['amount'] * 2 : r['amount'],
        comment: r['comment'],
        place:   r['place'],
        date:    r['date']
      }
    end
    self.transaction do
      self.delete_all
      self.create(boughts)
    end
  end
end
