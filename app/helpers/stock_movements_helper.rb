module StockMovementsHelper
  def stock_movement_color(movement_type)
    colors = {
      "initial" => "bg-yellow-100 text-yellow-800 hover:bg-yellow-200",
      "adjustment" => "bg-green-100 text-green-800 hover:bg-green-200",
      "sale" => "bg-red-100 text-red-800 hover:bg-red-200",
      "purchase" => "bg-blue-100 text-blue-800 hover:bg-blue-200",
      "transfer_in" => "bg-purple-100 text-purple-800 hover:bg-purple-200",
      "transfer_out" => "bg-orange-100 text-orange-800 hover:bg-orange-200"
    }

    colors[movement_type] || "bg-gray-100 text-gray-800"
  end
end
