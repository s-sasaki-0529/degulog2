class Bought < ApplicationRecord
  BANK_MERGED_DATE = Date.new(2017, 10, 1)

  #
  # ZaimAPIを用いてテーブルを最新の状態にする
  #
  def self.synchronize
    api_response = Zaim.new.fetch_pets_payments
    boughts = api_response.map do |r|
      {
        amount:  actual_amount(r),
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

  private_class_method

    #
    # 支出情報から金額を取得する
    # 金額は口座合併の都合上、2017/10/1以前の支払いについては2倍する
    #
    def self.actual_amount(payment)
      if Date.parse(payment['date']) < BANK_MERGED_DATE
        payment['amount'] * 2
      else
        payment['amount']
      end
    end
end
