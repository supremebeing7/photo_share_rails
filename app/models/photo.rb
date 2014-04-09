class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo
end
