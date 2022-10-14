class Api::V1::SessionsController < Api::ApiController
  skip_before_action :ensure_token, only: :create

  def create
    resource = User.find_for_database_authentication(email: params.dig(:user, :email))
    return invalid_login_attempt unless resource && resource.valid_password?(params.dig(:user, :password))
    if resource.valid_password?(params[:user][:password])
      resource.generate_auth_token!
      resource.save
      sign_in('user', resource)
      json_status(:ok, { id: resource.id, email: resource.email, auth_token: resource.auth_token, created_at: resource.created_at, updated_at: resource.updated_at })
    end
  end

  def destroy
    if current_user.present?
      sign_out(current_user)
      json_status(:ok, 'User Signed Out')
      current_user.update_attribute(:auth_token, nil)
    else
      json_status(:unauthorized, 'Authentication token is not valid')
    end
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    json_status(:unauthorized, 'Invalid Email or Password')
  end
end
