require 'rails_helper'

RSpec.describe OrderMenu, type: :model do
  describe "initialization" do
    let(:order_menu) { OrderMenu.new(quantity: 10) }

    it "initializes OrderMenu given quantity" do
      expect(order_menu.quantity).to eq(10)
    end
  end

  describe "attributes" do
    let(:order_menu) { OrderMenu.new }

    it "should have attribute quantity" do
      expect(order_menu).to respond_to(:quantity)
    end
  end

  describe "values" do
    let(:empty_order_menu) { OrderMenu.new }
    let(:order_menu) { OrderMenu.new(quantity: 0) }

    it "is invalid without value of quantity" do
      empty_order_menu.valid?
      expect(empty_order_menu.errors[:quantity]).to be_present
    end

    it "is invalid with non-positive quantity" do
      order_menu.valid?
      expect(order_menu.errors[:quantity]).to be_present
    end
  end
end
