class ApplicationController < ActionController::Base
  include Authentication
  include Pundit::Authorization
  include Pagy::Backend

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  set_current_tenant_through_filter
  before_action :set_organization_as_tenant

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def pundit_user
    Current.user
  end

  def set_organization_as_tenant
    if Current.user
      organization = Current.user.organization
      set_current_tenant(organization)
    end
  end

    def user_not_authorized(exception)
      flash[:alert] = "No tienes permiso para realizar esta acción."
      redirect_back(fallback_location: root_path)
    end
end
