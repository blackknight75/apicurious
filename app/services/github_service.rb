class GithubService

  def self.repos(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/repos?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/followers?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
