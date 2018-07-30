class OrderItem < ApplicationRecord
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  belongs_to :menu
end
