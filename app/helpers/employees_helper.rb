module EmployeesHelper
  def status_employee_color(status_name)
    colors = {
      true => "bg-green-100 text-green-800 hover:bg-green-200",
      false => "bg-red-100 text-red-800 hover:bg-red-200"
    }

    colors[status_name] || "bg-gray-100 text-gray-800"
  end
end
