class ReposController < ApplicationController

  def index
    @repos = Repo.all(current_user)
  end
end
