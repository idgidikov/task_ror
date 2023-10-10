# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Brand.create(name: 'Nike', description: 'the best', active: true, redemption: 'online')
Brand.create(name: 'Puma', description: 'the better', active: true, redemption: 'instore')
Brand.create(name: 'Reebok', description: 'good', active: true, redemption: 'online')
brand1 = Brand.find_or_create_by(name: 'Nike')
brand2 = Brand.find_or_create_by(name: 'Puma')
brand3 = Brand.find_or_create_by(name: 'Reebok')


3.times do
    Product.create(
      name: 'Nike Shoes',
      amount: 10.0,  
      brand_id: brand1.id,
      active: true  
    )
  end

  3.times do
    Product.create(
      name: 'Puma Shoes',
      amount: 20.0,  # Adjust the amount as needed
      brand_id: brand2.id,
      active: true  # Set the active status as needed
    )
  end

  3.times do
    Product.create(
      name: 'Reebok Shoes',
      amount: 20.0,  # Adjust the amount as needed
      brand_id: brand3.id,
      active: true  # Set the active status as needed
    )
  end