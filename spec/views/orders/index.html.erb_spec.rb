require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  let(:restaurant) { Restaurant.new }
  let(:customer) { Customer.new }
  let(:driver) { Driver.new }

  before(:each) do
    assign(:orders, [
      Order.create!(
        :restaurant => restaurant,
        :customer => customer,
        :driver => driver
      ),
      Order.create!(
        :restaurant => restaurant,
        :customer => customer,
        :driver => driver
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => restaurant.to_s, :count => 2
    assert_select "tr>td", :text => customer.to_s, :count => 2
    assert_select "tr>td", :text => driver.to_s, :count => 2
  end
end
