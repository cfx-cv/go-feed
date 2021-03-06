require "rails_helper"

RSpec.describe MenusController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Menu.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      menu = Menu.create! valid_attributes
      get :show, params: { id: menu.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    let(:restaurant) {
      Restaurant.create!(
        name: "Warunk Nasgor",
        address: "Test address",
        description: "Test description",
        phone: "0808080808",
        position:  Position.new(latitude: 37.774929, longitude: -122.419418)
      )
    }

    it "returns a success response" do
      get :new, params: { restaurant_id: restaurant }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      menu = Menu.create! valid_attributes
      get :edit, params: { id: menu.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Menu" do
        expect {
          post :create, params: { menu: valid_attributes }, session: valid_session
        }.to change(Menu, :count).by(1)
      end

      it "redirects to the created menu" do
        post :create, params: { menu: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Menu.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { menu: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested menu" do
        menu = Menu.create! valid_attributes
        put :update, params: { id: menu.to_param, menu: new_attributes }, session: valid_session
        menu.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the menu" do
        menu = Menu.create! valid_attributes
        put :update, params: { id: menu.to_param, menu: valid_attributes }, session: valid_session
        expect(response).to redirect_to(menu)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        menu = Menu.create! valid_attributes
        put :update, params: { id: menu.to_param, menu: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested menu" do
      menu = Menu.create! valid_attributes
      expect {
        delete :destroy, params: { id: menu.to_param }, session: valid_session
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to the menus list" do
      menu = Menu.create! valid_attributes
      delete :destroy, params: { id: menu.to_param }, session: valid_session
      expect(response).to redirect_to(menus_url)
    end
  end
end
