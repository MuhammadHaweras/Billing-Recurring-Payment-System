class Api::V1::PlansController < Api::ApiController
  def index
     json_status(:ok, Plan.all)
  end

  def my_plans
    if current_user.subscriptions?
      json_status(:ok, current_user.subscriptions)
    else
      json_status(:not_found, 'User do not have any subscriptions')
  end
end
