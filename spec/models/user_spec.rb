require "rails_helper"

RSpec.describe User, type: :model do
  describe "attributes" do
    let(:user) { User.new }

    it "should have attribute username" do
      expect(user).to respond_to(:username)
    end

    it "should have attribute email" do
      expect(user).to respond_to(:email)
    end

    it "should have attribute password" do
      expect(user).to respond_to(:password)
    end
  end

  describe "role" do
    let(:roles) { %i(customer driver) }
    let(:user) { User.new }

    it "should have customer as default role" do
      expect(user.role).to eq("customer")
    end

    it "should be valid with certain role" do
      roles.each do |role|
        user.role = role
        user.valid?
        expect(user.errors[:role]).to_not be_present
      end
    end
  end
end
