module AuthenticationHelpers
  def sign_in(user)
    login_path = '/session'
    email_param = :email_address
    password_param = :password

    password_value = 'password'

    post login_path, params: {
      email_param => user.email_address,
      password_param => password_value
    }
  end
end
