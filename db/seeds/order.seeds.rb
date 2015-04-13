after :buyer do
  print 'Seeding Orders'

  BuyerAccount.find_each do |buyer|
    (1..10).to_a.sample.times do
      sample_date = Faker::Time.between 10.days.ago, Time.now

      order =
        buyer.orders.new :item => Faker::Commerce.product_name,
          :quantity => rand(5),
          :budget => Faker::Commerce.price,
          :target => Faker::Date.between(Date.today, 10.days.from_now),
          :details => Faker::Lorem.sentence,
          :created_at => sample_date,
          :updated_at => sample_date

      order.save

      categories =[]

      until categories.present?
        categories = Category.ids.sample((1..2).to_a.sample)
      end

      order.category_ids = categories

      print '.'
    end
  end

end

puts
