class StarredController < ApplicationController
  before_action :authorize!

  def index
    @starred_repos = Starred.all(current_user)
  end
end
