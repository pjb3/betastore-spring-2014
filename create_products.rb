require './config/environment'

50.times do
  p = Product.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price)

  # p = Product.new
  # p.name = Faker::Commerce.product_name
  # p.price = Faker::Commerce.price

  p.save
end

products_with_prices = Product.where('price > 0')

products_with_prices.order('price desc').limit(3).each do |p|
#for p in Product.order('price desc').limit(3)
  puts "#{p.name} $%0.2f" % p.price.to_f
end

puts
puts "Total number of products: %d" % products_with_prices.count
puts "Average product price: $%0.2f" % products_with_prices.average(:price)
