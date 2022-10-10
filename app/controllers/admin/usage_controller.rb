class Admin::UsageController < Admin::AdminsController
  def index
    @users = User.joins(:subscriptions).distinct
  end

  def show
    @user = User.buyer.find(params[:id])
    @subscriptions = @user.subscriptions.includes(:consume_features, plan: [feature_plans: [:feature]])
    @bill = Payment.where(user_id: @user.id).last
  end
end
