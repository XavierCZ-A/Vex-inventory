# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  # Este filtro se ejecutará ANTES de la acción 'index'
  before_action :authorize_admin_to_view_employees, only: [ :index ] # Puedes añadir otras acciones si también son solo para admin

  def index
    # Si llegamos aquí, el before_action ya verificó que el usuario es admin.
    # Simplemente carga los datos.
    @users = User.organization_users.employee
  end

  # --- Otras acciones del controlador (edit, update, etc.) si las tienes ---
  # Podrías necesitar otros before_action o llamadas a `authorize` aquí
  # dependiendo de los permisos para esas acciones.

  private

  def authorize_admin_to_view_employees
    policy = EmployeePolicy.new(pundit_user, nil)

    unless policy.index?
      raise Pundit::NotAuthorizedError, "No tienes permiso para acceder a esta página."
    end
  end
end
