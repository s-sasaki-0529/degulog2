RSpec.describe '/api/measurements/', type: :request do
  before do
    FactoryBot.create_list(:measurement, 5)
    FactoryBot.create_list(:degu, 3, :weights)
  end

  describe 'GET /api/measurements' do

    before do
      get api_measurements_path, params: params
      @measurements = JSON.parse(response.body)
    end

    context 'パラメータを指定しない場合' do
      let(:params) { {} }

      it '全件取得できる' do
        expect(@measurements.count).to eq Measurement.count
      end

      it '体重が登録されたデグーの体重一覧が含まれている' do
        measurement = @measurements[0]
        id          = measurement['id']
        weights     = measurement['weights']
        expect(weights.count).to eq Degu.count
        Degu.all.each do |degu|
          expect_weight = Measurement.find(id).weights.find_by(degu: degu).value
          expect(weights[degu.id.to_s]).to eq expect_weight
        end
      end
    end

  end
end
