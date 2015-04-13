print 'Seeding Admin'

admin =
  AdminAccount.new :email => 'admin@is226.com',
    :password => 'password',
    :first_name => 'Admin',
    :last_name => 'Account'
admin.skip_confirmation!
admin.save

print '.'

puts