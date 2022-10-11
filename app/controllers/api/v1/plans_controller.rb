class Api::V1::PlansController < Api::ApiController
  def index
     render json: {status: 'successful', plan: Plan.all}
  end
end
