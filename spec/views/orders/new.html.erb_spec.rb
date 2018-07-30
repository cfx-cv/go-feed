require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :restaurant => nil,
      :customer => nil,
      :driver => nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[restaurant_id]"

      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[driver_id]"
    end
  end
end
