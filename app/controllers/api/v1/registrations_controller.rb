class Api::V1::RegistrationsController < Api::ApiController
  skip_before_action :ensure_token

  def create
    @user = User.new(user_params)
    @user.avatar.attach(io: File.open('app/assets/images/human.jpeg'),
                 filename: 'human.jpeg')
    if @user.save
      json_status(:created, {id: @user.id, email: @user.email,
                  created_at: @user.created_at, auth_token: @user.auth_token})
    else
      json_status(:not_acceptable, @user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
