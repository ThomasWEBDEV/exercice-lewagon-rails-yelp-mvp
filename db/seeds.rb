# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Cleaning database..."
# Supprime tous les restaurants (et leurs avis associés grâce à dependent: :destroy)
Restaurant.destroy_all
puts "Database cleaned!"

puts "Creating restaurants and reviews..."

# Création du premier restaurant
restaurant_1 = Restaurant.create!(
  name: "Le Petit Paris",
  address: "12 Rue de la Paix, 75002 Paris",
  phone_number: "01 23 45 67 89",
  category: "french"
)
Review.create!(
  content: "Excellente cuisine française, service impeccable !",
  rating: 5,
  restaurant: restaurant_1
)
Review.create!(
  content: "Un peu cher mais ça vaut le coup.",
  rating: 4,
  restaurant: restaurant_1
)

# Création du deuxième restaurant
restaurant_2 = Restaurant.create!(
  name: "Sushi Wok",
  address: "5 Avenue des Champs, 69000 Lyon",
  phone_number: "04 98 76 54 32",
  category: "japanese"
)
Review.create!(
  content: "Les meilleurs sushis de la ville !",
  rating: 5,
  restaurant: restaurant_2
)

# Création du troisième restaurant
restaurant_3 = Restaurant.create!(
  name: "Pizza Bella",
  address: "Rue de la Pizza, 13000 Marseille",
  phone_number: "06 11 22 33 44",
  category: "italian"
)

puts "Finished!"
