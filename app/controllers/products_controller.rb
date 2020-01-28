class ProductsController < ApplicationController
  before_action :find_category
  def index
    @categories = Category.all
    @products = @category.products
  end

  def show
    @product = Product.includes([:product_images, :complements]).find_by_permalink(params[:permalink])
    if @product.nil?
      redirect_to products_path(@category.permalink)
      return
    end
    @product_images = @product.product_images
    @related_complements = @product.complements
    @complement_type = @related_complements.first.try(:category)
    unless @complement_type.nil?
      @complements = Complement.where("category = '#{@complement_type}'")
    end
    @additionals = @product.complements.where("category = 'Additional'")
  end

  private

    def find_category
      @category = Category.find_by_permalink(params[:category])
      if @category.nil?
        redirect_to root_path
      end
    end
end
