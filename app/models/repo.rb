class Repo
  attr_reader :name, :description, :language, :updated_at

  def initialize(params)
    @name = params[:name]
    @description = params[:description]
    @language = params[:language]
    @updated_at = params[:updated_at]
  end

  def self.all(current_user)
    #returns an array of user specific repo objects
    repo_hashes = GithubService.repos(current_user)
    repo_hashes.map do |repo_hash|
      Repo.new(repo_hash)
    end
  end
end
