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
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/following?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/starred?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.following_events(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/received_events?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.commits(current_user, repo_name)
    response = Faraday.get("https://api.github.com/repos/#{current_user.username}/#{repo_name}/commits?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.organizations(current_user)
    response = Faraday.get("https://api.github.com/users/#{current_user.username}/orgs?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.organization_members(current_user, organization_url)
    response = Faraday.get(organization_url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
