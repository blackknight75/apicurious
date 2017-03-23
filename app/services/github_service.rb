class GithubService

  def self.repos(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/repos?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/followers?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.following(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/following?cliend_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/starred?cliend_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
