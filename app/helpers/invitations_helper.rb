module InvitationsHelper
  def status_color_invitation(status_name)
    colors = {
      "pending" => "bg-yellow-100 text-yellow-800 hover:bg-yellow-200",
      "accepted" => "bg-green-100 text-green-800 hover:bg-green-200",
      "rejected" => "bg-red-100 text-red-800 hover:bg-red-200"
    }

    colors[status_name] || "bg-gray-100 text-gray-800"
  end
end
