class ListingService

  def initialize(brokerage, current_broker_user)
    @brokerage = brokerage
    @current_broker_user = current_broker_user
  end

  def create(attributes)
    listing = @brokerage.new_listing_in_jurisdiction
    listing.creator = @current_broker_user
    listing.save(attributes)
    listing
  end

  def update(listing, new_attributes)
    client_attributes = new_attributes.pop(:client)
    Listing.transaction do
      listing.update(new_attributes)
      if listing.client_managed

      else
        listing.listing_managers.destroy_all
      end
    end
    listing
  end
end
