RSpec.describe 'Degus', type: :request do

  describe "GET /api/degus" do
    it '全件取得できる' do
      get api_degus_path
      @json = JSON.parse(response.body)
      p @json
    end
  end

end
