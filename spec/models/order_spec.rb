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

  describe "invalidation of status" do
    let(:statuses) { %i(available pending ordered completed) }
    let(:order) { Order.new }

    it "should be valid with certain status" do
      statuses.each do |status|
        order.status = status
        order.valid?
        expect(order.errors[:status]).to_not be_present
      end
    end
  end
end
