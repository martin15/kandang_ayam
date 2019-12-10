class LocationsController < ApplicationController
  def show
    @location = Location.find_by_permalink(params[:permalink])
    if @location.nil?
      redirect_to root_path
      return
    end
    @locations = Location.all.order("name")
    @location_images = @location.location_images
  end
end
