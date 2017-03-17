class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.new
    @restaurants = Restaurant.all

    # @rest_ratings = Rating.where("restaurant_id=?", )
  end

  def create
    @restaurant = Restaurant.new(rest_params)
    if @restaurant.save
      flash[:notice] = "Restaurant successfully added!"
      redirect_to root_path
    else
      flash[:errors] = @restaurant.errors.full_messages
      redirect_to root_path
    end
  end

private
  def rest_params
    params.require(:restaurant).permit(:name)
  end
end
