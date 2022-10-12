class Api::V1::RegistrationsController < Api::ApiController
  def create
    @user = User.new(user_params)
    @user.avatar.attach(io: File.open('app/assets/images/human.jpeg'),
                 filename: 'human.jpeg')
    if @user.save
      render json: {status: :created, user: {id: @user.id, email: @user.email,
                  created_at: @user.created_at, auth_token: @user.auth_token}}
    else
      render json: {status: :not_acceptable, user: @user.errors}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
