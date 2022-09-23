class Admin::FeaturesController < Admin::AdminsController
  protect_from_forgery with: :exception
  

  def new
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.new
  end

  def edit
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.find(params[:id])
  end 

  def create
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.create(feature_params)
    if @feature.save
      redirect_to admin_plan_path(@plan), notice: 'Feature added!'
    else   
      render 'new', error: 'Failed to edit feature!'  
    end  
  end

  def update
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.find(params[:id])
    if @feature.update(feature_params)
      redirect_to admin_plan_path(@plan)
    else
      render 'edit'
    end
  end  

  def destroy
    @plan = Plan.find(params[:plan_id])
    @feature = @plan.features.find(params[:id])
    @feature.destroy
    redirect_to admin_plan_path(@plan)
  end

  private
  def feature_params
    params.require(:feature).permit(:feature_name, :code, :unit_price, :max_unit_limit, :plan_id)
  end
end  
