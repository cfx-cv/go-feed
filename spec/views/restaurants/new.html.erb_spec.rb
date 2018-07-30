require 'rails_helper'

RSpec.describe "restaurants/new", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :address => "MyString",
      :description => "MyText",
      :phone => "MyString"
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input[name=?]", "restaurant[name]"

      assert_select "input[name=?]", "restaurant[address]"

      assert_select "textarea[name=?]", "restaurant[description]"

      assert_select "input[name=?]", "restaurant[phone]"
    end
  end
end
