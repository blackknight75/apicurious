class FollowingEventsController < ApplicationController
  before_action :authorize!

  def index
    @following_events = FollowingEvent.all(current_user)
  end
end
