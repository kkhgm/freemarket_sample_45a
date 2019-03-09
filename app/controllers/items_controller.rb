class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def show
  end

  def edit
    each_item
  end

  def update
    each_item
    render :action => "edit" unless @item.update(item_params)
  end

   def destroy
    each_item
    @item.destroy
    redirect_to action: 'index'
  end

  def each_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :shipping_method, :shipping_charge, :ship_from_region, :shipping_date, :price)
  end
end
