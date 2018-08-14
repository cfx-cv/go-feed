require "rails_helper"

RSpec.describe Restaurant, type: :model do
  describe "initialization" do
    let(:position) { Position.new(latitude: 37.774929, longitude: -122.419418) }

    let(:restaurant) {
      Restaurant.new(
        name: "Warunk Nasgor",
        address: "Test address",
        description: "Test description",
        phone: "0808080808",
        position: position
      )
    }

    it "initializes Restaurant given attributes" do
      expect(restaurant.name).to eq("Warunk Nasgor")
      expect(restaurant.address).to eq("Test address")
      expect(restaurant.description).to eq("Test description")
      expect(restaurant.phone).to eq("0808080808")
      expect(restaurant.position).to eq(position)
    end
  end

  describe "attributes" do
    let(:restaurant) { Restaurant.new }

    it "should have attribute name" do
      expect(restaurant).to respond_to(:name)
    end

    it "should have attribute address" do
      expect(restaurant).to respond_to(:address)
    end

    it "should have attribute description" do
      expect(restaurant).to respond_to(:description)
    end

    it "should have attribute phone" do
      expect(restaurant).to respond_to(:phone)
    end

    it "should have attribute phone" do
      expect(restaurant).to respond_to(:position)
    end
  end

  describe "invalidation" do
    let(:restaurant) { Restaurant.new }

    it "is invalid without value of name" do
      restaurant.valid?
      expect(restaurant.errors[:name]).to be_present
    end

    it "is invalid without value of address" do
      restaurant.valid?
      expect(restaurant.errors[:address]).to be_present
    end
  end
end
