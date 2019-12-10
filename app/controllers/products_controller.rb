class ProductsController < ApplicationController
  before_action :find_category
  def index
    @categories = Category.all
    @products = @category.products
  end

  def show
    @product = Product.includes([:product_images, :sauces]).find_by_permalink(params[:permalink])
    if @product.nil?
      redirect_to products_path(@category.permalink)
      return
    end
    @product_images = @product.product_images
    @relared_sauces = @product.sauces
    @sauce_type = @relared_sauces.first.try(:category)
    unless @sauce_type.nil?
      @sauces = Sauce.where("category = '#{@sauce_type}'")
    end
  end

  private

    def find_category
      @category = Category.find_by_permalink(params[:category])
      if @category.nil?
        redirect_to root_path
      end
    end
end
