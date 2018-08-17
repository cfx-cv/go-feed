require "rails_helper"

RSpec.describe Position, type: :model do
  describe "initialization" do
    let(:position) { Position.new(latitude: 37.774929, longitude: -122.419418) }

    it "initializes Position given latitude and longitude" do
      expect(position.latitude).to eq(37.774929)
      expect(position.longitude).to eq(-122.419418)
    end
  end

  describe "attributes" do
    let(:position) { Position.new }

    it "should have attribute latitude" do
      expect(position).to respond_to(:latitude)
    end

    it "should have attribute longitude" do
      expect(position).to respond_to(:longitude)
    end
  end

  describe "values" do
    let(:empty_position) { Position.new }
    let(:position) { Position.new(latitude: 37.774929, longitude: -122.419418) }

    it "are invalid without value of latitude" do
      empty_position.valid?
      expect(empty_position.errors[:latitude]).to be_present
    end

    it "are invalid without value of longitude" do
      empty_position.valid?
      expect(empty_position.errors[:longitude]).to be_present
    end
  end
end
