after :categories do
  print 'Seeding Bidders'

  10.times do |i|
    bidder =
      BidderAccount.new :email => "bidder#{i}@is226.com",
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :company_name => Faker::Company.name,
        :contact_person => Faker::Name.name,
        :contact_number => Faker::PhoneNumber.phone_number,
        :password => 'password'
    bidder.skip_confirmation!
    bidder.save

    categories = []

    until categories.present?
      categories = Category.ids.sample((1..3).to_a.sample)
    end

    bidder.category_ids = categories

    print '.'
  end
end

puts
