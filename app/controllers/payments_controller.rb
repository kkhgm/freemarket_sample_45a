class PaymentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Customer.create(card: params[:payjp_token])
    @payment = Payment.new(user_id: current_user.id, card_token: params[:payjp_token])
    if @payment.save
      redirect_to root_path, notice: "カードの作成が完了しました"
    else
      redirect_to new_user_payment_path, alert: "カード作成エラー"
    end
  end

  def destroy
  end

  private
  def payment_params
    params.require(:payment).permit(:user_id, :customer_id, :payjp_token).merge(user_id: current_user.id)
  end

end
