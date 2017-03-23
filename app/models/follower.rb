class Follower
attr_reader :name, :image, :url

  def initialize(params)
    @name = params[:login]
    @image = params[:avatar_url]
    @url = params[:html_url]
  end

  def self.all(current_user)
    followers_hashes = GithubService.followers(current_user)
    followers_hashes.map do |follower_hash|
      Follower.new(follower_hash)
    end
  end
end
