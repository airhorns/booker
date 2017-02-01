module AddressValidation
  extend ActiveSupport::Concern

  included do
    validates :street_1, presence: true
    validates :postal_code, presence: true
    validates :city, presence: true
    validates :region, presence: true
    validates :country, presence: true
  end
end
