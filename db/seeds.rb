# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
50.times do |i|
  Sku.create(
    description: "Producto #{i + 1}",
    part_number: "PN-#{rand(100000000000..999999999999)}",  # número aleatorio de 12 dígitos
    location: "#{format('%02d', rand(1..50))}-#{format('%02d', rand(1..50))}-#{('A'..'Z').to_a.sample}#{rand(1..9)}"
  )
end
