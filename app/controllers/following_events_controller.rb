class FollowingEventsController < ApplicationController

  def index
    @following_events = FollowingEvent.all(current_user)
    binding.pry
  end
end
