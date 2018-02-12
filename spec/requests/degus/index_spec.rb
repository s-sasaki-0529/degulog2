RSpec.describe 'Degus', type: :request do

  FactoryBot.create_list(:degu, 10)

  describe "GET /api/degus" do
    it '全件取得できる' do
      get api_degus_path
      expect(JSON.parse(response.body).count).to eq Degu.count
    end
  end

end
