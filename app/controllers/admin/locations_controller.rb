class Admin::LocationsController < Admin::ApplicationController
  before_action :find_banner, :only => [:edit, :update, :destroy, :delete]

  def index
    @locations = Location.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @location = Location.new
    @location.location_images.build
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = 'Location was successfully create.'
      redirect_to admin_locations_path
    else
      @location.location_images = []
      @location.location_images.build   
      flash[:error] = "Location failed to create"
      render :action => :new
    end
  end

  def edit
    if @location.location_images.blank?
      @location.location_images.build
    end
  end

  def update
    if @location.update_attributes(location_params)
      flash[:notice] = 'Location was successfully updated.'
      redirect_to admin_locations_path
    else
      if @location.location_images.blank?
        @location.location_images.build
      end
      flash[:error] = "Location failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @location.destroy ? 'Location was successfully deleted.' :
                                          'Location was falied to delete.'
    redirect_to admin_locations_path
  end

  private

    def location_params
      params.require(:location).permit(:name, :address, :phone, :lat, :long, :location_url,
                                       location_images_attributes: [:id, :image, :_destroy] )
    end

    def find_banner
      @location = Location.find_by_id(params[:id])
      if @location.nil?
        flash[:notice] = "Cannot find the Location with id '#{params[:id]}'"
        redirect_to admin_locations_path
      end
    end
end
