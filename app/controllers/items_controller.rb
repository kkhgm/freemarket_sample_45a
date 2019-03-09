class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def show

  end

   def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to action: 'index'
  end
end
