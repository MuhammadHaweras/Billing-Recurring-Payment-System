class Admin::PaymentsController < Admin::AdminsController
  def create
    total_amount = PaymentService.new(payment_params[:plan_id], payment_params[:user_id]).call
    if Payment.create(payment_params.merge(total_bill: total_amount))
     redirect_to admin_usage_path(payment_params[:user_id]), notice: 'Payment Generated!'
    else
      redirect_to admin_usage_path(payment_params[:user_id]), alert: 'Error! Payment can not be generated!'
    end
  end

  def show
    @buyer = User.buyer.find(params[:id])
    @payments = @buyer.payments
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :plan_id, :total_bill)
  end
end
