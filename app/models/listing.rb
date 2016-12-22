class Listing < ApplicationRecord
  belongs_to :brokerage
  belongs_to :creator, class_name: 'Broker::User'
end
