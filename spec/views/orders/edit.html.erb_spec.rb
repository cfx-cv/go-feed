require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :restaurant => nil,
      :customer => nil,
      :driver => nil
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[restaurant_id]"

      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[driver_id]"
    end
  end
end
