class FollowingController < ApplicationController
  before_action :authorize!

  def index
    @followings = Following.all(current_user)
  end
end
