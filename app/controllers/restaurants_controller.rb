class RestaurantsController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @staticmap = @restaurant.fetch_map
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    position = Position.create(filtered_params.slice(:latitude, :longitude))
    @restaurant = Restaurant.new(restaurant_params.merge(position: position))

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    position = Position.new(filtered_params.slice(:latitude, :longitude))
    restaurant_params = restaurant_params.merge(position: position) if position.save

    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def filtered_params
      params.require(:restaurant).permit(:name, :address, :description, :phone, :latitude, :longitude)
    end

    def restaurant_params
      filtered_params.slice(:name, :address, :description, :phone)
    end
end
