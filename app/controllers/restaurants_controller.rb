class RestaurantsController < ApplicationController
  before_action :find, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # no view (comes from new view)
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
    # raise
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  # before show, edit, update and destroy run this code!
  def find
    @restaurant = Restaurant.find(params[:id])
  end
end
