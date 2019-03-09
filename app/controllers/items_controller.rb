class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    redirect_to :action => "edit" unless @item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :shipping_method, :shipping_charge, :ship_from_region, :shipping_date, :price)
  end
end
