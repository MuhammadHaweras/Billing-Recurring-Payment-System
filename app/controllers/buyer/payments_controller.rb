class Buyer::PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end
  def payment_status
    @payment = Payment.find(params[:id])
    @payment.update(payment: @payment.payment = true )
    redirect_to buyer_subscriptions_path, notice: 'Bill amount has been deducted from your account'
  end
end
