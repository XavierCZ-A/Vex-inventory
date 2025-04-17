class OrganizationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  layout "login_layout"

  # GET /organizations/new
  def new
    @organization = Organization.new
    @organization.users.build
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      # ActsAsTenant.current_tenant = @organization
      start_new_session_for(@organization.users.last)
      redirect_to root_path, notice: "Organization was successfully created."
    else
      flash.now[:alert] = "Error, there are missing fields "
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params.expect(:id))
    end

    def organization_params
      params.require(:organization).permit(:name, users_attributes: [ :name, :last_name, :email_address, :password, :role ])
    end
end
