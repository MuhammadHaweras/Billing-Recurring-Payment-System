class Admin::PaymentsController < Admin::AdminsController
  def create
    id = payment_params[:user_id]
    total = Payment.total_payment(id)

    if Payment.create!(payment_params.merge(total_bill: total))
       redirect_to admin_usage_path(id), notice: 'Payment Generated!'
    else
      redirect_to admin_usage_index_path, alert: 'Payment generation failed for this user!'
    end

  end

  def show; end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:user_id, :total_bill)
  end
end
