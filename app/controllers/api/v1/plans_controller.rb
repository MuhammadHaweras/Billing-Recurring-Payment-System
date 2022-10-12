class Api::V1::PlansController < Api::ApiController
  def index
     render json: {status: :ok, plan: Plan.all}
  end
end
