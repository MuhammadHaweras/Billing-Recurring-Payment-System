class Api::ApiController < ActionController::Base
  include Response

  protect_from_forgery with: :null_session
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :ensure_token

  def current_user
    token = request.headers['authorization'].presence
    if token
      @current_user ||= User.find_by_auth_token(token)
    end
  end

  def authenticate_with_token!
    json_status(:unauthorized, 'Not authenticated') unless current_user.present?
  end

  def not_found
    json_status(:not_found, 'Could not find any data')
  end

   def ensure_token
    return if current_user
    json_status(:bad_request, 'Authorization Token not exists')
  end
end
