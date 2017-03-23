class Following
  attr_reader :name, :image, :url

  def initialize(params)
    @name = params[:login]
    @image = params[:avatar_url]
    @url = params[:html_url]
  end

  def self.all(current_user)
    following_hash = GithubService.following(current_user)
    following_hash.map do |following|
      Following.new(following)
    end
  end
end
