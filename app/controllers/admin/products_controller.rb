class Admin::ProductsController < Admin::ApplicationController
  before_action :find_product, :only => [:edit, :update, :destroy, :delete]

  def index
    @products = Product.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was successfully create.'
      redirect_to admin_products_path
    else
      @product.product_images = []
      @product.product_images.build 
      flash[:error] = "Product failed to create"
      render :action => :new
    end
  end

  def edit
    if @product.product_images.blank?
      @product.product_images.build
    end
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to admin_products_path
    else
      if @product.product_images.blank?
        @product.product_images.build
      end
      flash[:error] = "Product failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @product.destroy ? 'Product was successfully deleted.' :
                                                'Product was falied to delete.'
    redirect_to admin_products_path(@brand.id)
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :best_seller, :favorite, 
                                      :category_id, sauce_ids: [],
                                      product_images_attributes: [:id, :image, :_destroy])
    end

    def find_product
      @product = Product.find_by_id(params[:id])
      if @product.nil?
        flash[:notice] = "Cannot find the Product with id '#{params[:id]}'"
        redirect_to admin_products_path
      end
    end
end
