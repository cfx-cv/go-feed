class Restaurant < ApplicationRecord
  validates :name, :address, presence: true

  has_many :menus
  belongs_to :position
end
