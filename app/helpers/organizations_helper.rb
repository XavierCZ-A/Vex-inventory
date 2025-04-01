module OrganizationsHelper
  def status_color(status_name)
    colors = {
      "pending" => "bg-blue-100 text-blue-800 hover:bg-blue-200",
      "shipped" => "bg-yellow-100 text-yellow-800",
      "delivered" => "bg-green-100 text-green-800",
      "cancelled" => "bg-red-100 text-red-800"
    }

    colors[status_name] || "bg-gray-100 text-gray-800"
  end
end
