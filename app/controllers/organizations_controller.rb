class OrganizationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :set_organization, only: %i[ show edit update destroy ]
  layout "login_layout"

  # GET /organizations/1 or /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    @organization.users.build
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      ActsAsTenant.current_tenant = @organization
      redirect_to @organization, notice: "Organization was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: "Organization was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy!
    redirect_to organizations_path, status: :see_other, notice: "Organization was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # def organization_params
    #   params.expect(organization: [ :name, users_attributes: [ :name, :last_name, :email_address, :password, :role ] ])
    # end
    def organization_params
      params.require(:organization).permit(:name, users_attributes: [ :name, :last_name, :email_address, :password, :role ])
    end
end
