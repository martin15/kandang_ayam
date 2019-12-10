class Admin::LocationImagesController < Admin::ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_location, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_location_image, :only => [:edit, :update, :destroy]

  def new
    respond_to do |format|
      @location_image = LocationImage.new
      format.js
    end
  end

  def create
    @location_image = LocationImage.new(location_image_params)
    @location_image.location = @location
    if @location_image.save
      flash[:notice] = 'LocationImage was successfully create.'
    else
      flash[:error] = "LocationImage failed to create"
    end
    redirect_to edit_admin_location_path(@location.id)
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @failed_location_image = 0
    if @location_image.update_attributes(location_image_params)
      flash[:notice] = 'LocationImage was successfully updated.'
      redirect_to edit_admin_location_path(@location.id)
    else
      flash[:error] = "LocationImage failed to update"
      @failed_location_image = @location_image.id
      redirect_to edit_admin_location_path(@location.id, failed_location_image: @location_image.id)
    end
  end

  def destroy
    flash[:notice] =  @location_image.destroy ? 'LocationImage was successfully deleted.' :
                                                'LocationImage was falied to delete.'
    redirect_to edit_admin_location_path(@location.id)
  end

  private

    def location_image_params
      params[:location_image] = {image: ""} if params[:location_image].blank?
      params.require(:location_image).permit(:image)
    end

    def find_location_image
      @location_image = LocationImage.find_by_id(params[:location_image_id])
      if @location_image.nil?
        flash[:notice] = "Cannot find the LocationImage with id '#{params[:location_image_id]}'"
        redirect_to admin_locations_path
      end
    end

    def find_location
      @location = Location.find_by_id(params[:id])
      if @location.nil?
        flash[:notice] = "Cannot find the Location with id '#{params[:id]}'"
        redirect_to admin_locations_path
      end
    end
end
