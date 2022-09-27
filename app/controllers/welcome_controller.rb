class WelcomeController < ApplicationController
  before_action :root_redirect_path

  def index; end

  private

  def root_redirect_path
    redirect_to admin_plans_path if user_signed_in? && current_user.admin?
    redirect_to buyer_plans_path if user_signed_in? && current_user.buyer?
  end
end
