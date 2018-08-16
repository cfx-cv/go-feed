require "rails_helper"

RSpec.describe Order, type: :model do
  describe "attributes" do
    let(:order) { Order.new }

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

  describe "status" do
    let(:statuses) { %i(available pending ordered completed) }
    let(:order) { Order.new }

    it "should have available as default status" do
      expect(order.status).to eq("available")
    end

    it "should be valid with certain status" do
      statuses.each do |status|
        order.status = status
        order.valid?
        expect(order.errors[:status]).to_not be_present
      end
    end

    it "should update its status upon calling update_status" do
      statuses[1..-1].each do |status|
        order.update_status
        expect(order.status).to eq(status.to_s)
      end
    end
  end
end
