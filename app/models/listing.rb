class Listing < ApplicationRecord
  belongs_to :brokerage
  belongs_to :creator_id
end
