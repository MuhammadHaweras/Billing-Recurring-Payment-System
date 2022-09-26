class Admin::PlansController < Admin::AdminsController
  before_action :set_plan, only: %i[show edit update destroy]
  
  def index
    @plans = Plan.all
  end 
  
  def new
    @plan = Plan.new
  end  

  def create
    @plan = Plan.new(plan_params)

    if @plan.save 
      redirect_to admin_plans_path, notice: 'Plan added!'    
    else   
      render 'new', error: 'Failed to edit plan!'      
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
    params.require(:plan).permit(:plan_name, :monthly_fee)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end 
