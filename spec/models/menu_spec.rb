require "rails_helper"

RSpec.describe Menu, type: :model do
  describe "initialization" do
    let(:menu) { Menu.new(name: "Nasgor", price: 15_000) }

    it "initializes Menu given name and price" do
      expect(menu.name).to eq("Nasgor")
      expect(menu.price).to eq(15_000)
    end
  end

  describe "attributes" do
    let(:menu) { Menu.new }

    it "should have attribute name" do
      expect(menu).to respond_to(:name)
    end

    it "should have attribute price" do
      expect(menu).to respond_to(:name)
    end
  end

  describe "values" do
    let(:empty_menu) { Menu.new }
    let(:menu) { Menu.new(name: "Nasgor", price: -15_000) }

    it "are invalid without value of name" do
      empty_menu.valid?
      expect(empty_menu.errors[:name]).to be_present
    end

    it "are invalid without value of price" do
      empty_menu.valid?
      expect(empty_menu.errors[:price]).to be_present
    end

    it "are invalid with negative price" do
      menu.valid?
      expect(menu.errors[:price]).to be_present
    end
  end
end
