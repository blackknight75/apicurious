class FollowingEvent
  attr_reader :event_type, :username, :user_image, :repo_url, :created_at

  def initialize(params)
    @event_type = params[:type].split("Event")[0]
    @username = params[:actor][:login]
    @user_image = params[:actor][:avatar_url]
    @repo_url = params[:actor][:url]
    @created_at = params[:created_at].split("T")[0]
  end

  def self.all(current_user)
    following_event_hashes = GithubService.following_events(current_user)
    following_event_hashes.map do |event|
      FollowingEvent.new(event)
    end
  end
end
