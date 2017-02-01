class Client < ApplicationRecord
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_many :listings, through: :listing_managers
end
