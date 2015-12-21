class Report < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true

  # Convert a location to city and country
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    geo = results.first
    if geo
      obj.city = geo.city
      obj.country = geo.country
    end
  end

  after_validation(on: :create) do
    reverse_geocode
  end
end
