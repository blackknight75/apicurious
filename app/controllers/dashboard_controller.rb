class DashboardController < ApplicationController
before_action :authorize!
  def index
    @starred_repos_count = Starred.all(current_user).count
    @commits_by_repo = Commit.all(current_user).first(5)
    @repos = Repo.all(current_user).first(6)
  end
end
