Product.destroy_all
Review.destroy_all

50.times do |i|
  product = Product.create!(name: Faker::Food.ingredient,
  cost: Faker::Number.between(1, 50),
  country: Faker::Address.country)

250.times do |i|
    review = product.reviews.create!(author: Faker::Name.name,
    content: Faker::Lorem.characters(200),
    rating:  Faker::Number.between(1, 5))
  end
end

p "Created products"
p "Created reviews"
