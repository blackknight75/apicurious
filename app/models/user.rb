class User < ApplicationRecord

  def self.find_user(authorized_data, access_token)
    user = User.find_or_create_by(uid: authorized_data[:id])
    user.set_attributes(authorized_data, access_token)
    user
  end

  def set_attributes(authorized_data, access_token)
    self.username = authorized_data[:login]
    self.token = access_token
    self.email = authorized_data[:email]
    self.image = authorized_data[:avatar_url]
    self.repos_url = authorized_data[:repos_url]
    self.public_repos = authorized_data[:public_repos]
    self.public_gists = authorized_data[:public_gists]
    self.starred_url = authorized_data[:starred_url]
    self.followers_url = authorized_data[:followers_url]
    self.followers = authorized_data[:followers]
    self.following_url = authorized_data[:following_url]
    self.following = authorized_data[:following]
    self.name = authorized_data[:name]
    self.location = authorized_data[:location]
    self.save
  end
end
