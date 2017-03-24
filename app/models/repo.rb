class Repo
  attr_reader :name, :description, :language, :updated_at

  def initialize(params)
    @name = params[:name]
    @description = params[:description]
    @language = params[:language]
    @updated_at = params[:updated_at].split("T")[0]
  end

  def self.all(current_user)
    repo_hashes = GithubService.repos(current_user)
    repo_hashes.map do |repo_hash|
      Repo.new(repo_hash)
    end
  end

  def self.names(current_user)
    repos = GithubService.repos(current_user)
    repos.map do |repo|
      repo[:name]
    end
  end
end
