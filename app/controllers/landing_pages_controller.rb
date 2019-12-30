class LandingPagesController < ApplicationController
  def show
    @landing_page = LandingPage.find_by_permalink(params[:permalink])
    
  end
end
