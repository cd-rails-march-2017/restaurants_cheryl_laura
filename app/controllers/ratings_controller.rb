class RatingsController < ApplicationController

def create
  @rating = Rating.new(rating_params)
  @rating.user_id = session[:id]
  if @rating.save
    redirect_to root_path
  else
    flash[:errors] = @rating.errors.full_messages
    redirect_to root_path
  end
end

def rating_params
  params.require(:rating).permit(:stars, :restaurant_id)
end
end
