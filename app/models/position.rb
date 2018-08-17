class Position < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true

  def to_s
    "#{self.latitude},#{self.longitude}"
  end
end
