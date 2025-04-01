module AuthenticationHelpers
  def login_user
    # Primero crear una organización
    organization = FactoryBot.create(:organization)

    # Hay dos enfoques posibles:

    # # Opción 1: Si estás usando ActsAsTenant.with_tenant en tu aplicación
    # ActsAsTenant.with_tenant(organization) do
    #   user = FactoryBot.create(:user, organization: organization)
    #   post sessions_path, params: { email_address: user.email, password: 'SecretPassword' }
    #   user
    # end

    # Opción 2: Sin usar el bloque ActsAsTenant.with_tenant
    @user = FactoryBot.create(:user, organization: organization)
    post "/session", params: { email_address: @user.email_address, password: 'SecretPassword' }
  end
end
