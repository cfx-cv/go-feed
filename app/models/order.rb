class Order < ApplicationRecord
  enum status: [:available, :pending, :ordered, :completed]
  validates :status, inclusion: { in: statuses.keys }

  belongs_to :restaurant
  belongs_to :customer, class_name: "User"
  belongs_to :driver, class_name: "User", optional: true
  belongs_to :order_destination, class_name: "Position"

  has_many :order_menus

  def total_price
    self.order_menus.reduce(0) { |sum, menu| sum + (menu.price * menu.quantity) }
  end

  def fetch_distance_duration
    params = {
      origin: self.restaurant.position.to_s,
      destination: self.order_destination.to_s
    }

    url = "#{ENV["GATEWAY_URI"]}/distance?#{params.to_query}"
    resp = HTTP.get(url)

    fallback = {
      "distance" => {
        "text" => "0 meters",
        "value" => 0,
      },
      "duration" => {
        "text" => "0 seconds",
        "value" => 0
      }
    }
    return fallback if resp.to_s.empty?

    JSON.parse(resp.to_s)
  end

  def fetch_staticmap
    params = {
      origin: self.restaurant.position.to_s,
      destination: self.order_destination.to_s
    }

    url = "#{ENV["GATEWAY_URI"]}/staticmap?#{params.to_query}"
    resp = HTTP.get(url)

    fallback = ""
    return fallback if resp.to_s.empty?

    json = JSON.parse(resp.to_s)
    json["staticmap"]
  end

  def update_status
    status = Order.statuses[self.status] + 1
    self.update(status: status) if Order.statuses.has_value?(status)
  end

  def available?
    self.status == "available"
  end

  def owned?
    self.customer == current_user || self.driver == current_user
  end
end
