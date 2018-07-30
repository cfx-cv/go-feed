class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  belongs_to :driver
end
