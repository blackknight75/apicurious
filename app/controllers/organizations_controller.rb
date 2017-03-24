class OrganizationsController < ApplicationController
  before_action :authorize!

  def index
    @organizations = Organization.all(current_user)
  end
end
