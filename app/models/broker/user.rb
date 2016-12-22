module Broker
  class User < ApplicationRecord
    include DeviseInvitable::Inviter
    self.table_name = 'broker_users'

    devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
    has_paper_trail

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { scope: :brokerage_id }
    validates :phone, presence: true
    validates :brokerage_id, presence: true

    belongs_to :brokerage, inverse_of: :users
    has_many :invited_users, class_name: to_s, as: :invited_by

    def name
      "#{first_name} #{last_name}"
    end
  end
end
