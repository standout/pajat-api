class Report < ActiveRecord::Base
  enum status: { unresolved: 0, resolved: 1 }

  has_many :comments

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
