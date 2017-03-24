class OrganizationMember
  attr_reader :username, :image, :github_url
  def initialize(params)
    @username = params[:login]
    @image = params[:avatar_url]
    @github_url = params[:html_url]
  end
end
