# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Category.create!([
#   { name: "Electronics" },
#   { name: "Clothing" },
#   { name: "Books" },
#   { name: "Home & Garden" },
#   { name: "Health & Beauty" },
#   { name: "Toys & Hobbies" },
#   { name: "Sporting Goods" }
# ]
# )

PaymentTerm.create([
                     { name: "Immediate Payment", days: 0, description: "Payment at the time of receiving the invoice", active: true },
                     { name: "Net 15", days: 15, description: "Payment within 15 days", active: true },
                     { name: "Net 30", days: 30, description: "Payment within 30 days", active: true },
                     { name: "Net 60", days: 60, description: "Payment within 60 days", active: true }
                   ])
