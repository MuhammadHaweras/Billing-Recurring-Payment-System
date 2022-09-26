class Admin::FeaturesController < Admin::AdminsController
  protect_from_forgery with: :exception
  before_action :set_plan, only: %i[new edit create update destroy]
  before_action :set_feature, only: %i[edit update destroy]

  def new
    @feature = @plan.features.new
  end

  def edit
    @feature = @plan.features.find(params[:id])
  end 

  def create
    @feature = @plan.features.create(feature_params)

    if @feature.save
      redirect_to admin_plan_path(@plan), notice: 'Feature added!'
    else   
      render 'new', error: 'Failed to edit feature!'  
    end  
  end

  def update
    if @feature.update(feature_params)
      redirect_to admin_plan_path(@plan)
    else
      render 'edit'
    end
  end  

  def destroy
    @feature.destroy
    redirect_to admin_plan_path(@plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_feature
    @feature = @plan.features.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:feature_name, :code, :unit_price, :max_unit_limit, :plan_id)
  end
end  
