RSpec.describe Bought, type: :model do
  describe 'class method' do

    describe 'synchronize' do

      before do
        allow_any_instance_of(Zaim)
          .to receive(:fetch_pets_payments)
          .and_return(mock_payments)
        Bought.synchronize
      end

      context 'Zaim上に支出記録が存在しない場合' do
        let(:mock_payments) { [] }
        it 'Boughtテーブルが空になる' do
          expect(Bought.count). to eq 0
        end
      end

      context 'Zaim上に支出記録が存在する場合' do
        let(:mock_payments) do
          [
            {'date' => '2017-09-30', 'amount' => 1000, 'place' => 'Amazon', 'comment' => 'item1'},
            {'date' => '2017-10-01', 'amount' => 2000, 'place' => 'Amazon', 'comment' => 'item2'},
            {'date' => '2017-10-02', 'amount' => 3000, 'place' => 'Amazon', 'comment' => 'item3'},
          ]
        end
        it '支出の件数分レコードが作成される' do
          expect(Bought.count).to eq 3
        end
        it 'レコードに各属性が保存されている' do
          bought = Bought.find_by(comment: 'item3')
          expect(bought.date).to eq Date.parse('2017-10-02')
          expect(bought.amount).to eq 3000
          expect(bought.comment).to eq 'item3'
        end
        it '2017/10/01以前の支出は2倍になる' do
          expect(Bought.find_by(comment: 'item1').amount).to eq 1000 * 2
          expect(Bought.find_by(comment: 'item2').amount).to eq 2000
          expect(Bought.find_by(comment: 'item3').amount).to eq 3000
        end
        context '複数回実行した場合' do
          before do
            Bought.synchronize
            Bought.synchronize
          end
          it '最新分以外は削除される' do
            expect(Bought.count).to eq 3
          end
        end
      end
    end
  end
end
