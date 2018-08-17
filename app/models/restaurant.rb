require "http"
require "json"

class Restaurant < ApplicationRecord
  validates :name, :address, presence: true

  belongs_to :position

  has_many :menus

  def fetch_staticmap
    params = { origin: self.position.to_s }

    url = "#{ENV["GATEWAY_URI"]}/staticmap?#{params.to_query}"
    resp = HTTP.get(url)
    json = JSON.parse(resp.to_s)
    json["staticmap"]
  end
end
