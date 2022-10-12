class Buyer::PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def payment_status
    @payment = current_user.payments.find(params[:id])
    @payment.update(payment: true )
    redirect_to buyer_payments_path, notice: 'Bill amount has been deducted from your account'
  end
end
