class Admin::LandingPagesController < Admin::ApplicationController
  before_action :find_landing_page, :only => [:edit, :update, :destroy, :delete]

  def index
    @landing_pages = LandingPage.all.page(params[:landing_page]).per(20)
    @no = paging(20)
  end

  def new
    @landing_page = LandingPage.new
  end

  def create
    @landing_page = LandingPage.new(landing_page_params)

    if @landing_page.save
      flash[:notice] = 'LandingPage was successfully create.'
      redirect_to admin_landing_pages_path
    else
      flash[:error] = "LandingPage failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @landing_page.update_attributes(landing_page_params)
      flash[:notice] = 'LandingPage was successfully updated.'
      redirect_to admin_landing_pages_path
    else
      flash[:error] = "LandingPage failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @landing_page.destroy ? 'LandingPage was successfully deleted.' :
                                        'LandingPage was falied to delete.'
    redirect_to admin_landing_pages_path
  end

  private

    def landing_page_params
      params.require(:landing_page).permit(:title, :video, :banner, :section_one, :color_one,
                                           :section_two, :color_two, :section_three, :color_three)
    end

    def find_landing_page
      @landing_page = LandingPage.find_by_id(params[:id])
      if @landing_page.nil?
        flash[:notice] = "Cannot find the LandingPage with id '#{params[:id]}'"
        redirect_to admin_landing_pages_path
      end
    end
end
