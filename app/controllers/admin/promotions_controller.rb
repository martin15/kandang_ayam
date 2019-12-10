class Admin::PromotionsController < Admin::ApplicationController
  before_action :find_category, :only => [:edit, :update, :destroy, :delete]

  def index
    @promotions = Promotion.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(category_params)
    if @promotion.save
      flash[:notice] = 'Promotion was successfully create.'
      redirect_to admin_promotions_path
    else
      flash[:error] = "Promotion failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @promotion.update_attributes(category_params)
      flash[:notice] = 'Promotion was successfully updated.'
      redirect_to admin_promotions_path
    else
      flash[:error] = "Promotion failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @promotion.destroy ? 'Promotion was successfully deleted.' :
                                           'Promotion was falied to delete.'
    redirect_to admin_promotions_path
  end

  private

    def category_params
      params.require(:promotion).permit(:name, :description, :term_and_conditions, :image, :promo_type)
    end

    def find_category
      @promotion = Promotion.find_by_id(params[:id])
      if @promotion.nil?
        flash[:notice] = "Cannot find the Promotion with id '#{params[:id]}'"
        redirect_to admin_promotions_path
      end
    end
end
