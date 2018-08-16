class Position < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true
end
