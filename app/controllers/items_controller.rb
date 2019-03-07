class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def show

  end

  def edit
    @item = Item.find(params[:id])
  end

end
