class FollowingController < ApplicationController

  def index
    @followings = Following.all(current_user)
  end
end
