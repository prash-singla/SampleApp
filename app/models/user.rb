
class User < ActiveRecord::Base
	include UsersHelper
  has_one :profile, dependent: :destroy
  EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 8 }, length: { maximum: 16}
  validates :email ,presence: true, uniqueness: true, confirmation: true, :format => EMAIL_REGEX
  validates_confirmation_of :email

 end