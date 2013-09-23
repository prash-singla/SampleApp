class Profile < ActiveRecord::Base
  include Paperclip::Glue
  belongs_to :user
  has_attached_file :avatar

  scope :in_city, lambda { |city| {:conditions => ["currentcity = ?", city]} }

end
