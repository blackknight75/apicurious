class SessionsController < ApplicationController

  def create
    github_oauth = GithubOauth.new(params['code'])
    access_token = github_oauth.access_token
    authorized_data = github_oauth.data
    user = User.find_user(authorized_data, access_token)

    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
