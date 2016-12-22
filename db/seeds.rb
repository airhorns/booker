AdminUser.destroy_all
Brokerage.destroy_all
Broker::User.destroy_all
Listing.destroy_all

AdminUser.new(email: 'admin@admin.com', password: 'admin1', password_confirmation: 'admin1').save!

umber = Brokerage.new(name: 'Umber Realty', logo_url: 'http://www.umberrealty.com/wp-content/uploads/2016/10/UmberRealtyInc-Logo.png')
umber.save!
umber.users.create!(first_name: 'Shaun', last_name: 'Denis', email: 'shaun@umber.com', phone: '111 222 3333', password: 'example', password_confirmation: 'example')
umber.users.create!(first_name: 'Kristen', last_name: 'Denis', email: 'kristen@umber.com', phone: '+1 (111) 2223333', password: 'example', password_confirmation: 'example')
umber.users.create!(first_name: 'Jess', last_name: 'Petrella', email: 'jess@umber.com', phone: '+1 111-222-3333', password: 'example', password_confirmation: 'example')
