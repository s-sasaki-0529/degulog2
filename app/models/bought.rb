class Bought < ApplicationRecord

  # ZaimAPIを用いてテーブルを最新の状態にする
  def self.synchronize
    api_response = Zaim.new.getPetsPayments
    boughts = api_response.map do |r| 
      {
        amount:  r['amount'] * 2, # 折半分
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

  # 月ごとの総支出を取得
  def self.monthly_amounts
    monthly = []
    self.group("DATE_FORMAT(date, '%Y-%m')").sum(:amount).each do |key, val|
      monthly.push month: key, amount: val
    end
    monthly.sort_by {|m| m[:month]}.reverse
  end

end
