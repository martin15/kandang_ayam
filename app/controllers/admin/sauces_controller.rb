class Admin::SaucesController < Admin::ApplicationController
  before_action :find_sauce, :only => [:edit, :update, :destroy, :delete]

  def index
    @sauces = Sauce.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @sauce = Sauce.new
  end

  def create
    @sauce = Sauce.new(sauce_params)

    if @sauce.save
      flash[:notice] = 'Sauce was successfully create.'
      redirect_to admin_sauces_path
    else
      flash[:error] = "Sauce failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @sauce.update_attributes(sauce_params)
      flash[:notice] = 'Sauce was successfully updated.'
      redirect_to admin_sauces_path
    else
      flash[:error] = "Sauce failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @sauce.destroy ? 'Sauce was successfully deleted.' :
                                        'Sauce was falied to delete.'
    redirect_to admin_sauces_path
  end

  private

    def sauce_params
      params.require(:sauce).permit(:name, :category, :image, :description )
    end

    def find_sauce
      @sauce = Sauce.find_by_id(params[:id])
      if @sauce.nil?
        flash[:notice] = "Cannot find the Sauce with id '#{params[:id]}'"
        redirect_to admin_sauces_path
      end
    end
end
