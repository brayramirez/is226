print 'Creating Admin'

Admin.create :email => 'admin@user.com',
  :password => 'p@$$w0rd',
  :password_confirmation => 'p@$$w0rd',
  :first_name => 'Admin',
  :last_name => 'Account'

print '.'

puts