class PromotionsController < ApplicationController
  before_action :find_promotion, only: [:show, :modal_show]

  def index
    params[:type] = Promotion::TYPE.first if params[:type].nil?
    if params[:type] == "All Promo"
      @promotions = Promotion.all
    else
      @promotions = Promotion.where("promo_type = '#{params[:type]}'")
    end
    @promotion_types = Promotion::TYPE
  end

  def show
  end

  def modal_show
    respond_to do |format|
      format.html do
        redirect_to promo_detail_path(type: params[:type], permalink: params[:permalink])
      end
      format.js
    end
  end

  private
    def find_promotion
      if params[:type].nil? || params[:permalink].nil?
        redirect_to promotions_path 
      end
      @promotion = Promotion.where("promo_type = '#{params[:type]}' and 
                                    permalink = '#{params[:permalink]}'").first
      if @promotion.nil?
        redirect_to promotions_path
      end
    end
end
