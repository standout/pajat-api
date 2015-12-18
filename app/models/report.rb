class Report < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
