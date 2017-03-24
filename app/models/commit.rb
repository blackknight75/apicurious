class Commit
  attr_reader :sha, :author_name, :commit_message, :commit_date
  def initialize(params)
    if params.count != 8
    else
      @sha = params[:sha]
      @author_name = params[:commit][:author][:name]
      @commit_message = params[:commit][:message]
      @commit_date = params[:commit][:author][:date].split("T")[0]
    end
  end

  def self.all(current_user)
    repo_names = Repo.names(current_user)
    commits = Array.new
    repo_names.each do |repo_name|
      commits_hashes = GithubService.commits(current_user, repo_name)
      # commits_for_repo = Array.new
      commits_for_repo = commits_hashes.map do |commit|
        Commit.new(commit)
      end
      commits << {repo_name => commits_for_repo}
    end
    commits
  end
end
