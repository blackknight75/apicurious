class Starred
  attr_reader :name, :description, :language, :updated_at

  def initialize(params)
    @name = params[:name]
    @description = params[:description]
    @language = params[:language]
    @updated_at = params[:updated_at]
  end

  def self.all(current_user)
    starred_repos_hashes = GithubService.starred(current_user)
    starred_repos_hashes.map do |starred|
      Starred.new(starred)
    end
  end
end
