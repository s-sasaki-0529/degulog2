RSpec.describe Measurement, type: :model do
  describe 'callback' do

    describe 'after_create' do
      context '同日のレコードがすでにある場合' do
        let(:old_measurement) { FactoryBot.create(:measurement) }
        let(:old_id) { old_measurement.id }
        let(:date) { old_measurement.date }

        it '対象レコードを全て削除する' do
          expect(Measurement.find_by(id: old_id).present?).to eq true
          Measurement.create(date: date)
          expect(Measurement.find_by(id: old_id).present?).to eq false
        end
      end
    end
  end
end
