require 'oauth'
require 'json'
require 'pp'
class Zaim

  API_URL = 'https://api.zaim.net/v2/'
  PETS_GENRE_ID = 10203

  #
  # ZaimAPIへのアクセストークンを生成する
  #
  def initialize
    oauth_params = {
      site: "https://api.zaim.net",
      request_token_path: "/v2/auth/request",
      authorize_url: "https://auth.zaim.net/users/auth",
      access_token_path: "https://api.zaim.net"
    }
    @consumer = OAuth::Consumer.new(ENV['ZAIM_API_KEY'], ENV['ZAIM_API_SECRET'], oauth_params)
    @access_token = OAuth::AccessToken.new(@consumer, ENV['ZAIM_API_OAUTH_TOKEN'], ENV['ZAIM_API_OAUTH_SECRET'])
  end

  #
  # ペット関連の支出一覧をzaimから取得
  #
  def getPetsPayments
    url = "home/money?mode=payment&genre_id=#{PETS_GENRE_ID}"
    response = get(url)
    response and return response['money']
  end

  #
  # 指定したURLにリクエストを送信し、レスポンスをJSONデシリアライズ
  #
  def get(url)
    response = @access_token.get("#{API_URL}#{url}")
    JSON.parse(response.body)
  end

end
