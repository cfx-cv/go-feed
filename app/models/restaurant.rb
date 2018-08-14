require "http"
require "json"

class Restaurant < ApplicationRecord
  validates :name, :address, presence: true

  has_many :menus
  belongs_to :position

  def fetch_map
    position = self.position
    resp = HTTP.get("http://suez_app/staticmap?origin=#{position.latitude},#{position.longitude}")
    json = JSON.parse(resp.to_s)
    json["staticmap"]
  end
end
