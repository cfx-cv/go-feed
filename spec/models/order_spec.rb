require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "attributes" do
    let(:restaurant) { Restaurant.new }
    let(:customer) { Customer.new }
    let(:driver) { Driver.new }
    let(:order) { Order.new(restaurant: restaurant, customer: customer, driver: driver) }

    it "should have attribute customer_id" do
      expect(order).to respond_to(:customer_id)
    end

    it "should have attribute driver_id" do
      expect(order).to respond_to(:driver_id)
    end

    it "should have attribute restaurant_id" do
      expect(order).to respond_to(:restaurant_id)
    end
  end
end
