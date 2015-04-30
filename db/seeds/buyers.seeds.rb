after :categories do
  print 'Seeding Buyers'

  10.times do |i|
    role = BuyerAccount.create :buyer_type => [:business, :individual].sample

    buyer =
      role.build_user :email => "buyer#{i}@is226.com",
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :company_name => Faker::Company.name,
        :contact_person => Faker::Name.name,
        :contact_number => Faker::PhoneNumber.phone_number,
        :password => 'password'
    buyer.skip_confirmation!

    buyer.save

    print '.'
  end
end

puts
