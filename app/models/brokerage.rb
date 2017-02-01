class Brokerage < ApplicationRecord
  include AddressValidation

  has_many :users, class_name: 'Broker::User', inverse_of: :brokerage
  has_many :listings, inverse_of: :brokerage

  validates :name, presence: true

  validates :valid_listing_cities, presence: true, length: { minimum: 1 }
  validates :valid_listing_regions, presence: true, length: { minimum: 1 }
  validates :valid_listing_countries, presence: true, length: { minimum: 1 }

  def new_listing_in_jurisdiction
    listings.build(
      city: valid_listing_cities.first,
      region: valid_listing_regions.first,
      country: valid_listing_countries.first
    )
  end
end
