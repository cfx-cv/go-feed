class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params.slice(:restaurant_id, :customer_id, :driver_id))
    create_order_menus if saved = @order.save

    respond_to do |format|
      if saved
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_order_menus
      order_params[:menus].each do |menu_id, quantity|
        OrderMenu.create(order_id: @order.id, menu_id: menu_id, quantity: quantity)
      end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:restaurant_id, :customer_id, :driver_id, menus: {})
    end
end
