module OrganizationsHelper
  def status_color(status_name)
    colors = {
      "pending" => "bg-blue-100 text-blue-800",
      "shipped" => "bg-yellow-100 text-yellow-800",
      "delivered" => "bg-green-100 text-green-800",
      "cancelled" => "bg-red-100 text-red-800"
    }

    colors[status_name] || "bg-gray-100 text-gray-800"
  end

  def step_classes(step, current_step)
    if step < current_step
      "bg-green-500 border-green-500 text-white" # Pasos completados
    elsif step == current_step
      "border-[#7C5BF3] text-[#7C5BF3]" # Paso actual
    else
      "border-gray-300 text-gray-500" # Pasos pendientes
    end
  end
end
