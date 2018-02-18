RSpec.describe Degu, type: :model do
  describe 'scope' do
    before do
      FactoryBot.create_list(:degu, 3)
      FactoryBot.create_list(:degu, 2, :invalid)
    end

    describe 'valid' do
      let(:degus) { Degu.valid }
      it '取得できる全てのデグーのleave_dateがnil' do
        expect(degus.count).to eq 3
        degus.each do |degu|
          expect(degu.leave_date).to eq nil
        end
      end
    end

    describe 'invalid' do
      let(:degus) { Degu.invalid }
      it '取得できる全てのデグーのleave_dateがnilでない' do
        expect(degus.count).to eq 2
        degus.each do |degu|
          expect(degu.leave_date).not_to eq nil
        end
      end
    end
  end

  describe 'method' do

    describe 'current_weight' do
      let(:degu) { FactoryBot.create(:degu) }

      context '体重記録が存在する場合' do
        before do
          Measurement.create(date: '2017-01-01').weights.create(degu: degu, value: 140)
          Measurement.create(date: '2017-03-01').weights.create(degu: degu, value: 150)
          Measurement.create(date: '2017-02-01').weights.create(degu: degu, value: 160)
        end
        it '最新の体重が取得できる' do
          expect(degu.current_weight).to eq 150
        end
      end
      context '体重記録が存在しない場合' do
        it '0が戻る' do
          expect(degu.current_weight).to eq 0
        end
      end
    end
  end
end
