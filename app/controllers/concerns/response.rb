module Response
  extend ActiveSupport::Concern

  def json_status(status, message)
    render json: {status: status, message: message}
  end
end
