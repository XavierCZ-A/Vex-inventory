class EmployeesController < ApplicationController
  def index
    @users = User.organization_users.employee
  end
end
