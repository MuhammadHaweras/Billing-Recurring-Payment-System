class Api::V1::SessionsController < Api::ApiController
  before_action :ensure_user, only: :create

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      resource.generate_auth_token!
      resource.save
      sign_in('user', resource)
      render json: {status: :ok, user: { id: resource.id, email: resource.email, auth_token: resource.auth_token, created_at: resource.created_at, updated_at: resource.updated_at }}
        return
    end
    invalid_login_attempt
  end

  def destroy
    if current_user.present?
      sign_out(current_user)
      render json: {status: :ok, message: 'Your Account Logged Out Successfully' }
      current_user.update_attribute(:auth_token, nil)
    else
      render json: {status: :unauthorized, message: 'Authentication token is not valid' }
    end
  end

  protected

  def ensure_user
    render json: {status: :bad_request, message: 'Missing User Parameter'} if params[:user].blank?
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {status: :unauthorized, message: 'Error with your Email or password'}
  end
end
