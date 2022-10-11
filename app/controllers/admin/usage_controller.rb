class Admin::UsageController < Admin::AdminsController
  def index
    @users = User.joins(:subscriptions).distinct
  end

  def show
    @buyer = User.buyer.find(params[:id])
    @subscriptions = @buyer.subscriptions.includes(:consume_features, plan: [feature_plans: [:feature]])
    @bill = Payment.where(user_id: @buyer.id).last
  end
end
