class TradesController < ApplicationController

  def update
    Payjp.api_key = PAYJP_SECRET_KEY
    item = Item.find(params[:item_id])
    Payjp::Charge.create(currency: 'jpy', amount: item.price, card: params['payjp-token'])
    @trade = Trade.where( [ "id = ? and item_id = ?", params[:id], item ] )
    @trade.first.status = "取引完了"
    @trade.first.save
  end

end
