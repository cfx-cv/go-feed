class Order < ApplicationRecord
  enum status: [:available, :pending, :ordered, :completed]
  validates :status, inclusion: { in: statuses.keys }
  
  belongs_to :restaurant
  belongs_to :customer
  belongs_to :driver
end
