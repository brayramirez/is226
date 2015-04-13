print 'Seeding Admin'

role = AdminAccount.create
admin =
  role.build_user :email => 'admin@is226.com',
    :password => 'password',
    :first_name => 'Admin',
    :last_name => 'Account'
admin.skip_confirmation!
admin.save

print '.'

puts