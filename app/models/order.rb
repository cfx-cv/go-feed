class Order < ApplicationRecord
  enum status: [:available, :pending, :ordered, :completed]
  validates :status, inclusion: { in: statuses.keys }

  belongs_to :restaurant
  belongs_to :customer, class_name: "User"
  belongs_to :driver, class_name: "User", optional: true

  has_many :order_menus

  def total_price
    self.order_menus.reduce(0) { |sum, menu| sum + menu.price }
  end

  def fetch_distance_duration
    params = {
      origin: self.restaurant.position.to_s,
      destination: self.order_destination.to_s
    }

    url = "#{ENV["GATEWAY_URL"]}/distance?#{params.to_query}"
    resp = HTTP.get(url)
    JSON.parse(resp.to_s)
  end

  def fetch_staticmap
    params = {
      origin: self.restaurant.position.to_s,
      destination: self.order_destination.to_s
    }

    url = "#{ENV["GATEWAY_URL"]}/staticmap?#{params.to_query}"
    resp = HTTP.get(url)
    json = JSON.parse(resp.to_s)
    json[:staticmap]
  end

  def update_status
    status = Order.statuses[self.status] + 1
    self.update(status: status) if Order.statuses.has_value?(status)
  end
end
