Product.destroy_all
Review.destroy_all

50.times do |i|
  product = Product.create!(name: Faker::Food.ingredient,
  cost: Faker::Number.between(1, 50),
  country: Faker::Address.country)
end
