class ReposController < ApplicationController
  before_action :authorize!

  def index
    @repos = Repo.all(current_user)
  end
end
