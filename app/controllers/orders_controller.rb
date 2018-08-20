class OrdersController < ApplicationController
  before_action :require_admin, only: [:destroy]
  before_action :require_customer, only: [:create]
  before_action :require_driver, only: [:update]

  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.order(:status)
  end

  def show
    require_specific(@order.customer) if current_user.customer?
    require_specific(@order.driver) if current_user.driver? && !@order.available?

    distance_duration = @order.fetch_distance_duration
    @distance = distance_duration["distance"]
    @duration = distance_duration["duration"]

    @staticmap = @order.fetch_staticmap
  end

  def create
    customer = User.find(order_params[:customer_id])
    require_specific(customer)

    @order = Order.new(order_params.merge(order_destination: get_customer_position))
    create_order_menus if saved = @order.save

    respond_to do |format|
      if saved
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to Restaurant.find(order_params[:restaurant_id]) }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    driver = @order.driver || User.find(order_update_params[:driver_id])
    require_specific(driver) if !@order.available?

    updated = @order.update(order_update_params)
    @order.update_status if updated && update_status? && update_status_allowed?

    respond_to do |format|
      if updated
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :show }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def filtered_params
      params.require(:order).permit(:restaurant_id, :customer_id, :driver_id, :update_status, menus: {})
    end

    def order_params
      filtered_params.slice(:restaurant_id, :customer_id, :driver_id)
    end

    def order_update_params
      order_params.slice(:driver_id)
    end

    def get_customer_position
      latitude, longitude = request.location.latitude, request.location.longitude
      latitude, longitude = 0, 0 if latitude.nil? || longitude.nil?

      Position.create(latitude: latitude, longitude: longitude)
    end

    def create_order_menus
      filtered_params[:menus].each do |menu_id, quantity|
        OrderMenu.create(order_id: @order.id, menu_id: menu_id, quantity: quantity)
      end
    end

    def update_status?
      filtered_params[:update_status]
    end

    def update_status_allowed?
      current_user.driver? && @order.owned?(current_user)
    end
end
