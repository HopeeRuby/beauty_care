require 'faker'

20.times do |index|
  Product.create(name: "product #{index}", description: "description #{index}", quantity: (1..100).to_a.sample, price: (1..100).to_a.sample)
end
