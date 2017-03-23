class StarredController < ApplicationController

  def index
    @starred_repos = Starred.all(current_user)
  end
end
