class TradesController < ApplicationController
  before_action :set_trade

  def update
    Payjp.api_key = PAYJP_SECRET_KEY
    @item = Item.find_by(id: params[:item_id])
    @item.update(buyer_id: current_user.id)
    Payjp::Charge.create(currency: 'jpy', amount: @item.price, card: params['payjp-token'])
    @trade = Trade.find_by(item_id: @item)
    @trade.status = "取引完了"
    @trade.save
  end

  def index
    @item = @trade.item
    @buyer = @item.buyer
    @seller = @item.seller
    @tradecomment = Tradecomment.new
    @tradecomments = Tradecomment.where(trade_id: @trade.id).order(created_at: "DESC")
  end

  def create
    @tradecomment = Tradecomment.create(comment_params)
    redirect_to action: 'index'
  end

private
  def set_trade
    @trade = Trade.find_by(item_id: params[:item_id])
  end

  def comment_params
    params.require(:tradecomment).permit(:comment).merge(trade_id: @trade.id, user_id: current_user.id)
  end
end
