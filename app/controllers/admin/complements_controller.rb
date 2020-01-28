class Admin::ComplementsController < Admin::ApplicationController
  before_action :find_complement, :only => [:edit, :update, :destroy, :delete]

  def index
    @complements = Complement.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @complement = Complement.new
  end

  def create
    @complement = Complement.new(complement_params)

    if @complement.save
      flash[:notice] = 'Complement was successfully create.'
      redirect_to admin_complements_path
    else
      flash[:error] = "Complement failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @complement.update_attributes(complement_params)
      flash[:notice] = 'Complement was successfully updated.'
      redirect_to admin_complements_path
    else
      flash[:error] = "Complement failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] =  @complement.destroy ? 'Complement was successfully deleted.' :
                                        'Complement was falied to delete.'
    redirect_to admin_complements_path
  end

  private

    def complement_params
      params.require(:complement).permit(:name, :category, :image, :description )
    end

    def find_complement
      @complement = Complement.find_by_id(params[:id])
      if @complement.nil?
        flash[:notice] = "Cannot find the Complement with id '#{params[:id]}'"
        redirect_to admin_complements_path
      end
    end
end
