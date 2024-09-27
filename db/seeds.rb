# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Check if the admin user already exists to avoid duplicate creation
admin = User.find_or_create_by!(email: "admin@test.com") do |user|
  user.password = "testtesttest"
  user.password_confirmation = "testtesttest"
  user.role = "admin"
  user.name = "Admin User"
end

puts "Admin user has been created."

admin = User.find_or_create_by!(email: "teamleader@test.com") do |user|
  user.password = "testtesttest"
  user.password_confirmation = "testtesttest"
  user.role = "teamleader"
  user.name = "Teamleader"
end

puts "Manager user has been created."
