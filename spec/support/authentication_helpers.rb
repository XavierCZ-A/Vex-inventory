module AuthenticationHelpers
  # Simula el inicio de sesión haciendo un POST a la ruta de sesiones/login
  def sign_in(user)
    # --- AJUSTA ESTOS VALORES según tu aplicación ---
    login_path = '/session' # O podría ser /login, /users/sign_in, etc.
    email_param = :email_address # El nombre del parámetro para el email en tu form/controller
    password_param = :password    # El nombre del parámetro para la contraseña

    # Asegúrate de que tu factory de 'user' defina una contraseña
    # o pásala explícitamente si es necesario.
    # Aquí asumimos que user.password devolverá la contraseña correcta (podría no ser el caso si usas password_digest directamente)
    # Es común que las factories definan una contraseña 'password' por defecto.
    password_value = 'password' # O la contraseña definida en tu factory para el usuario

    post login_path, params: {
      email_param => user.email_address,
      password_param => password_value # Usa la contraseña real, no el digest
    }

    # Opcional: Verificar que el login fue exitoso (p.ej. redirige)
    # Esto puede hacer el helper más robusto pero también más lento/acoplado.
    # unless response.status == 302 # O 200 OK, dependiendo de tu flujo de login
    #   raise "Sign in failed! Status: #{response.status}, Body: #{response.body}"
    # end
  end

  # Podrías añadir un helper sign_out también si lo necesitas
  # def sign_out
  #   delete logout_path # Ajusta la ruta y el método HTTP
  # end
end
