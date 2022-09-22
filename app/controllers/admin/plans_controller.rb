class Admin::PlansController < ApplicationController
  protect_from_forgery with: :exception
  before_action :find_plan, only: %i[show edit update destroy]
  before_action :restrict_user_by_role
  VALID_ROLES = ['admin']

  def index
    @plans = Plan.all
  end 
  
  def show
  end  

  def new
    @plan = Plan.new
  end  

  def create
    @plan = Plan.new(plan_params)   
    if @plan.save   
      flash[:notice] = 'Plan added!'   
      redirect_to admin_plans_path   
    else   
      flash[:error] = 'Failed to edit plan!'   
      render 'new'   
    end   
  end

  def edit   
  end

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

  protected

  def restrict_user_by_role
    unless current_user && VALID_ROLES.include?(current_user.role)
      redirect_to root_path
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:plan_name, :monthly_fee)
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end
end 