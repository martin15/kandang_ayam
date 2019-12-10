class Admin::PromotionCodesController < Admin::ApplicationController
  before_action :find_banner, :only => [:edit, :update, :destroy, :delete]

  def index
    @promotion_codes = PromotionCode.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @promotion_code = PromotionCode.new
  end

  def create
    @promotion_code = PromotionCode.new(promotion_code_params)
    if @promotion_code.save
      flash[:notice] = 'PromotionCode was successfully create.'
      redirect_to admin_promotion_codes_path
    else
      flash[:error] = "PromotionCode failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @promotion_code.update_attributes(promotion_code_params)
      flash[:notice] = 'PromotionCode was successfully updated.'
      redirect_to admin_promotion_codes_path
    else
      flash[:error] = "PromotionCode failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @promotion_code.destroy ? 'PromotionCode was successfully deleted.' :
                                                'PromotionCode was falied to delete.'
    redirect_to admin_promotion_codes_path
  end

  private

    def promotion_code_params
      params.require(:promotion_code).permit(:name, :code, :state, :start_date, :end_date )
    end

    def find_banner
      @promotion_code = PromotionCode.find_by_id(params[:id])
      if @promotion_code.nil?
        flash[:notice] = "Cannot find the PromotionCode with id '#{params[:id]}'"
        redirect_to admin_promotion_codes_path
      end
    end
end
