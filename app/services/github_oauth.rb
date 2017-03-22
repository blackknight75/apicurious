class GithubOauth
attr_reader :code, :client_id, :client_secret, :access_token

  def initialize(code)
    @code = code
    @client_id = '7b59c1904f1e2f706091'
    @client_secret = 'b9742934284677364188a40a1b0220848464a868'
  end

  def access_token
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{@client_id}&client_secret=#{@client_secret}&code=#{@code}")
    @access_token = response.body.split(/\W+/)[1]
    @access_token
  end

  def data
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{@access_token}")
    data = JSON.parse(oauth_response.body, symbolize_names: true)
    data
  end
end
