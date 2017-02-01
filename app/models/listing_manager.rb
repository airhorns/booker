class ListingManager < ApplicationRecord
  belongs_to :client
  belongs_to :listing, inverse_of: :listing_managers
end
