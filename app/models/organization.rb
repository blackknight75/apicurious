class Organization
  attr_reader :name, :description, :image, :members

  def initialize(params, current_user)
    @name = params[:login]
    @description = params[:description]
    @image = params[:avatar_url]
    @members = get_members(params[:members_url])
    @current_user = current_user
  end

  def self.all(current_user)
    organizations = GithubService.organizations(current_user)
    organizations.map do |organization|
      Organization.new(organization, current_user)
    end
  end

  def get_members(members_url)
    members = GithubService.organization_members(@current_user, format_url(members_url))
    members.map do |member|
      OrganizationMember.new(member)
    end
  end

  def format_url(members_url)
    members_url.split("{/member}")[0] + "?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}"
  end
end
