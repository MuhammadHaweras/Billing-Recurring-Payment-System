class Api::V1::RegistrationsController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :check_user, only: :create

  def create
    if params[:user][:email].blank? || params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      render json: {status: 'Failed', message: 'Missing Parameters'}
    else
      @user = User.new(user_params)
      @user.avatar.attach(io: File.open('app/assets/images/human.jpeg'), filename: 'human.jpeg')
      @user.generate_auth_token!
      if @user.save
        render json: {status: 'Successful', user: {id: @user.id, email: @user.email,
                       created_at: @user.created_at, auth_token: @user.auth_token}}
      else
        render json: {status: 'Failed', user: @user.errors}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_user
    if User.exists?(email: params[:user][:email])
      render json: {status: 'Failed', message: 'User already exists'}
    end
  end
end
