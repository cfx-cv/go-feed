class Order < ApplicationRecord
  enum status: [:available, :pending, :ordered, :completed]
  validates :status, inclusion: { in: statuses.keys }

  belongs_to :restaurant
  belongs_to :customer, class_name: "User"
  belongs_to :driver, class_name: "User", optional: true

  has_many :order_menus

  def update_status
    status = Order.statuses[self.status] + 1
    self.update(status: status) if Order.statuses.has_value?(status)
  end
end
