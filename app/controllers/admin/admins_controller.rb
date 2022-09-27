class Admin::AdminsController < ApplicationController
  before_action :authorize_admin

  protected
  
  def authorize_admin
    return redirect_to buyer_plans_path unless current_user.admin?
  end
end	
