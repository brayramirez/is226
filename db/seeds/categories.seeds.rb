print 'Seeding Categories'

until Category.count == 15 do
  name = Faker::Commerce.department 1
  category = Category.where(:name => name).first_or_initialize
  next if category.persisted?

  category.save

  print '.'
end

puts
