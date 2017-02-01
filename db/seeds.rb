Listing.destroy_all
Broker::User.destroy_all
Brokerage.destroy_all
AdminUser.destroy_all

AdminUser.new(email: 'admin@admin.com', password: 'admin1', password_confirmation: 'admin1').save!

umber = Brokerage.new(
  name: 'Umber Realty',
  logo_url: 'http://www.umberrealty.com/wp-content/uploads/2016/10/UmberRealtyInc-Logo.png',
  street_1: '287 Maclaren',
  street_2: 'Unit 402',
  city: 'Ottawa',
  region: 'Ontario',
  country: 'Canada',
  postal_code: 'K2P 0L9',
  valid_listing_cities: ['Ottawa'],
  valid_listing_regions: ['Ontario'],
  valid_listing_countries: ['Canada'],
)

umber.save!
umber.users.create!(first_name: 'Shaun', last_name: 'Denis', email: 'shaun@umber.com', phone: '111 222 3333', password: 'example', password_confirmation: 'example', is_owner: true)
umber.users.create!(first_name: 'Kristen', last_name: 'Denis', email: 'kristen@umber.com', phone: '+1 (111) 2223333', password: 'example', password_confirmation: 'example')
umber.users.create!(first_name: 'Jess', last_name: 'Petrella', email: 'jess@umber.com', phone: '+1 111-222-3333', password: 'example', password_confirmation: 'example')

umber.listings.create!(street_1: '287 Maclaren', street_2: 'Unit 402', city: 'Ottawa', region: 'Ontario', country: 'Canada', postal_code: 'K1N 1N1', title: '287 Maclaren')
umber.listings.create!(street_1: '150 Elgin', street_2: '8th Floor', city: 'Ottawa', region: 'Ontario', country: 'Canada', postal_code: 'K1N 1N1', title: '150 Elgin')
umber.listings.create!(street_1: '14 Clarey', city: 'Ottawa', region: 'Ontario', country: 'Canada', postal_code: 'K1N 1N1', title: 'Elegant Glebe Home')
