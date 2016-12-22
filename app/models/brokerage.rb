class Brokerage < ApplicationRecord
  has_many :users, class_name: 'Broker::User', inverse_of: :brokerage

  validates :name, presence: true
end
