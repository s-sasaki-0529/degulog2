RSpec.describe 'Degus', type: :request do

  before do
    FactoryBot.create_list(:degu, 5)
    FactoryBot.create_list(:degu, 3, :invalid)
  end

  describe "GET /api/degus" do

    before do
      get api_degus_path, params: params
      @degus = JSON.parse(response.body)
    end

    context 'パラメータを指定しない場合' do
      let(:params) { {} }
      it '全件取得できる' do
        expect(@degus.count).to eq Degu.count
      end
    end

    context 'valid = 1を指定すると' do
      let(:params) { {valid: 1} }
      it '有効なデグーのみ取得できる' do
        expect(@degus.count).to eq Degu.where(leave_date: nil).count
      end
    end

    context 'invalid = 1を指定すると' do
      let(:params) { {invalid: 1} }
      it '無効なデグーのみ取得できる' do
        expect(@degus.count).to eq Degu.where.not(leave_date: nil).count
      end
    end

    context 'order = come_dateを指定すると' do
      let(:params) { {order: 'come_date'} }
      it '誕生日降順で取得できる' do
        @degus.inject(@degus.first) do |prev, current|
          expect(current['come_date']).to be >= prev['come_date']
          current
        end
      end
    end

  end

end
