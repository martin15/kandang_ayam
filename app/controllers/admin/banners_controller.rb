class Admin::BannersController < Admin::ApplicationController
  before_action :find_banner, :only => [:edit, :update, :destroy, :delete]

  def index
    static_banners = Banner::STATIC
    if params[:state] == "static-banner"
      @banners = Banner.where("permalink in (?)", static_banners).page(params[:page]).per(20)
    else
      @banners = Banner.where("permalink not in (?) or permalink is null", static_banners).page(params[:page]).per(20)
    end
    @no = paging(20)
  end

  def new
    @banner = Banner.new
    @image_size = "1280px x 548px"
  end

  def create
    @image_size = "1280px x 548px"
    @banner = Banner.new(banner_params)

    if @banner.save
      flash[:notice] = 'Banner was successfully create.'
      redirect_to admin_banners_path
    else
      flash[:error] = "Banner failed to create"
      render :action => :new
    end
  end

  def edit
    prepare_banner_size
  end

  def update
    if @banner.update_attributes(banner_params)
      flash[:notice] = 'Banner was successfully updated.'
      redirect_to admin_banners_path
    else
      prepare_banner_size
      flash[:error] = "Banner failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @banner.destroy ? 'Banner was successfully deleted.' :
                                        'Banner was falied to delete.'
    redirect_to admin_banners_path
  end

  private

    def banner_params
      params.require(:banner).permit(:image, :url, :order )
    end

    def find_banner
      @banner = Banner.find_by_id(params[:id])
      if @banner.nil?
        flash[:notice] = "Cannot find the Banner with id '#{params[:id]}'"
        redirect_to admin_banners_path
      end
    end

    def prepare_banner_size
      case @banner.permalink
      when "mini-banner-1", "mini-banner-2"
        @image_size = "570px x 214px"
      when "mini-banner-3"
        @image_size = "350px x 440px"
      when "mini-banner-4", "mini-banner-5"
        @image_size = "190px x 95px"
      when "mini-banner-6"
        @image_size = "190px x 229px"
      else
        @image_size = "1280px x 548px"
      end
    end
end
