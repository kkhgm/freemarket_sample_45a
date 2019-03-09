class ItemsController < ApplicationController
  before_action :each_item, except:[:index, :show]

  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def show
  end

  def edit
  end

  def update
    render :action => "edit" unless @item.update(item_params)
  end

   def destroy
    if @item.destroy
      redirect_to action: "index"
    else
      redirect_to action: "show"
    end
  end

  def each_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :shipping_method, :shipping_charge, :ship_from_region, :shipping_date, :price)
  end
end
