class Admin::AdminsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authorize_admin

  protected
  
  def authorize_admin
    return redirect_to buyer_users_path unless current_user.admin?
  end
end	
