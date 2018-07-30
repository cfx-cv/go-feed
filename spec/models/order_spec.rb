require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "attributes" do
    let(:restaurant) { Restaurant.new }
    let(:customer) { Customer.new }
    let(:driver) { Driver.new }
    let(:order) { Order.new(restaurant: restaurant, customer: customer, driver: driver) }

    it "should have attribute customer" do
      expect(order).to respond_to(:customer)
    end

    it "should have attribute driver" do
      expect(order).to respond_to(:driver)
    end

    it "should have attribute restaurant" do
      expect(order).to respond_to(:restaurant)
    end
  end
end
