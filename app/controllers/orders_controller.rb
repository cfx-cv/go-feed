class OrdersController < ApplicationController
  before_action :require_admin, only: [:destroy]

  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    distance_duration = @order.fetch_distance_duration
    @distance = distance_duration[:distance]
    @duration = distance_duration[:duration]

    @staticmap = @order.fetch_staticmap
  end

  def create
    @order = Order.new(order_params)
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
    updated = @order.update(order_params)
    @order.update_status if updated && update_status?

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

    def create_order_menus
      filtered_params[:menus].each do |menu_id, quantity|
        OrderMenu.create(order_id: @order.id, menu_id: menu_id, quantity: quantity)
      end
    end

    def update_status?
      order_params[:update_status]
    end
end
