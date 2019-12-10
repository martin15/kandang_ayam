class Admin::PagesController < Admin::ApplicationController
  before_action :find_page, :only => [:edit, :update, :destroy, :delete]

  def index
    @pages = Page.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = 'Page was successfully create.'
      redirect_to admin_pages_path
    else
      flash[:error] = "Page failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page was successfully updated.'
      redirect_to admin_pages_path
    else
      flash[:error] = "Page failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @page.destroy ? 'Page was successfully deleted.' :
                                        'Page was falied to delete.'
    redirect_to admin_pages_path
  end

  private

    def page_params
      params.require(:page).permit(:title, :content)
    end

    def find_page
      @page = Page.find_by_id(params[:id])
      if @page.nil?
        flash[:notice] = "Cannot find the Page with id '#{params[:id]}'"
        redirect_to admin_pages_path
      end
    end
end
