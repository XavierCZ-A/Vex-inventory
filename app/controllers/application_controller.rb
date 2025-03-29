class ApplicationController < ActionController::Base
  include Authentication
  include Pagy::Backend

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  set_current_tenant_through_filter
  before_action :set_organization_as_tenant

  private

  def set_organization_as_tenant
    if Current.user
      organization = Current.user.organization
      pp "Tenant =============> #{organization.inspect}"
      set_current_tenant(organization)
    end
  end
end
