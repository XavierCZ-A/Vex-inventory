module ProductsHelper
  def category_color(category_name)
    colors = {
      "Electronics" => "bg-blue-100 text-blue-800",
      "Clothing" => "bg-pink-100 text-pink-800",
      "Books" => "bg-yellow-100 text-yellow-800",
      "Home & Garden" => "bg-green-100 text-green-800",
      "Health & Beauty" => "bg-red-100 text-red-800",
      "Toys & Hobbies" => "bg-purple-100 text-purple-800",
      "Sporting Goods" => "bg-orange-100 text-orange-800"
    }

    colors[category_name] || "bg-gray-100 text-gray-800"
  end
end
