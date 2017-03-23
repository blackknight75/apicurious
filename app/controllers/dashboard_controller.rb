class DashboardController < ApplicationController
before_action :authorize!
  def index
    @starred_repos_count = Starred.all(current_user).count
  end
end
