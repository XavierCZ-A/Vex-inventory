# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  # Este filtro se ejecutará ANTES de la acción 'index'
  before_action :authorize_admin_to_view_employees, only: [ :index ] # Puedes añadir otras acciones si también son solo para admin

  def index
    @users = User.organization_users.employee
  end

  private

  def authorize_admin_to_view_employees
    policy = EmployeePolicy.new(pundit_user, nil)

    unless policy.index?
      raise Pundit::NotAuthorizedError, "No tienes permiso para acceder a esta página."
    end
  end
end
