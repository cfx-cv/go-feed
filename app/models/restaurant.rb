require "http"
require "json"

class Restaurant < ApplicationRecord
  validates :name, :address, presence: true

  has_many :menus
  belongs_to :position

  def fetch_map
    params = { origin: "#{self.position.latitude},#{self.position.longitude}" }
    url = "#{ENV["GATEWAY_URL"]}/staticmap?#{params.to_query}"

    resp = HTTP.get(url)
    json = JSON.parse(resp.to_s)
    json["staticmap"]
  end
end
