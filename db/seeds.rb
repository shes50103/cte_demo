100.times do
  Product.create!(
    name: Faker::Name.name,
    category_id: [*1..4].sample,
    active: [*1..10].sample > 3,
    quantity: [*1..8].sample
  )
end
