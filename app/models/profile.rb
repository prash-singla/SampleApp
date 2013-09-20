class Profile < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :user
  has_attached_file :avatar



scope :in_city, ->(cuurrentcity) { where(currentcity: currentcity) }


end
