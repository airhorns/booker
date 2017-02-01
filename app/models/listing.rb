class Listing < ApplicationRecord
  include AddressValidation

  belongs_to :brokerage, inverse_of: :listings
  belongs_to :creator, class_name: 'Broker::User'

  has_many :managing_ties, inverse_of: :listing
  has_many :clients, through: :listing_managers

  validates :title, presence: true

  def activate_now
    false
  end

  def activate_now=(val)
    self.activated_at = Time.now.utc if val
  end

  def address
    [street_1, street_2, city, region, country, postal_code].select(&:present?).join(', ')
  end

  def short_address
    [street_1, street_2, city].select(&:present?).join(', ')
  end
end
