class AdminUser < ApplicationRecord
  include DeviseInvitable::Inviter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def name
    "Booker Staff"
  end
end
