module Broker
  class ListingsController < BrokerAreaController
    def index
      @listings = Listing.includes(:clients).all
    end

    def show
      @listing = Listing.find(params[:id])
    end

    def new
      @listing = @brokerage.new_listing_in_jurisdiction
    end

    def edit
      @listing = Listing.find(params[:id])
    end

    def create
      @listing = @service.create(listing_params)

      if @listing.persisted?
        redirect_to @listing, notice: 'Listing was successfully created.'
      else
        render :new
      end
    end

    def update
      @listing = Listing.find(params[:id])
      if @service.update(@listing, listing_params)
        redirect_to @listing, notice: 'Listing was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      Listing.find(params[:id]).destroy
      redirect_to listings_url, notice: 'Listing was successfully destroyed.'
    end

    private

    def service
      @service ||= ListingService.new(@brokerage, current_broker_user)
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(
        :title,
        :description,
        :image_url,
        :activated_at,
        :street_1,
        :street_2,
        :postal_code,
        :client_managed,
        client: [
          :first_name,
          :last_name,
          :email,
          :telephone
        ]
      )
    end
  end
end
