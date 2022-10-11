class Api::V1::PlansController < Api::ApiController
  respond_to :json

  def index
     render json: {status: 'successful', plan: Plan.all}
  end
end
