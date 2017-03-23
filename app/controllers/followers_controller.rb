class FollowersController < ApplicationController

  def index
    @followers = Followers.all(current_user)
  end
end
