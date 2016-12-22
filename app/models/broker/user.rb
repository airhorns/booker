module Broker
  class User < ApplicationRecord
    self.table_name = 'broker_users'
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable
    has_paper_trail

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { scope: :brokerage_id }
    validates :phone, presence: true
    validates :brokerage_id, presence: true

    belongs_to :brokerage, inverse_of: :users

    def name
      "#{first_name} #{last_name}"
    end
  end
end
