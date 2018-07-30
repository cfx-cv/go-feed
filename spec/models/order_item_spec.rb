require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "initialization" do
    let(:order_item) { OrderItem.new(quantity: 10) }

    it "initializes OrderItem given quantity" do
      expect(order_item.quantity).to eq(10)
    end
  end

  describe "attributes" do
    let(:order_item) { OrderItem.new }

    it "should have attribute quantity" do
      expect(order_item).to respond_to(:quantity)
    end
  end

  describe "values" do
    let(:empty_order_item) { OrderItem.new }
    let(:order_item) { OrderItem.new(quantity: 0) }

    it "is invalid without value of quantity" do
      empty_order_item.valid?
      expect(empty_order_item.errors[:quantity]).to be_present
    end

    it "is invalid with non-positive quantity" do
      order_item.valid?
      expect(order_item.errors[:quantity]).to be_present
    end
  end
end
