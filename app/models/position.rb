class Position < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true

  def to_s
    "#{self.latitude},#{self.longitude}"
  end

  def address
    result = Geocoder.search(self.to_s)
    result.first.address
  end
end
