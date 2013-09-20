
class User < ActiveRecord::Base
	include UsersHelper
  has_one :profile, dependent: :destroy
  validates :password, presence: true, length: { minimum: 8 }, length: { maximum: 16}
  validates :email ,presence: true, uniqueness: true, confirmation: true
  validates_confirmation_of :email

  
  
end