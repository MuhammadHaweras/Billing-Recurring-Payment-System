class Admin::PlansController < Admin::AdminsController
  before_action :set_plan, only: %i[show edit update destroy]
  
  def index
    @plans = Plan.all
  end 
  
  def new
    @plan = Plan.new
  end  

  def create
    @plan = Plan.create(plan_params)

    if @plan.save 
      redirect_to admin_plans_path
    else
      render 'new'
    end   
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to admin_plans_path
    else
      render 'edit'
    end
  end

  def destroy
    @plan.destroy
    redirect_to admin_plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:plan_name, :monthly_fee, feature_plans_attributes: [:id, :plan_id, :feature_id, :allocated_units, :_destroy])
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end 
