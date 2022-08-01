require 'faker'

puts "Running the seeds!"

10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    city: Faker::Address.city
  )

  puts "Added another restaurant!"
end

puts "Finished adding restaurants!"
