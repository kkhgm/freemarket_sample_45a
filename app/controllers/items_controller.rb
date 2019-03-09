class ItemsController < ApplicationController

  layout 'singlepage', only: :new

  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
  	@item = Item.new
    @item.itemimages.build
  	@regions = Region.all
  end

  def create
  	@item = Item.create(item_params)
    redirect_to controller: :items, action: :index
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    render :action => "edit" unless @item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :shipping_method, :shipping_charge, :ship_from_region, :shipping_date, :price)
  end

  private
  def item_params
  	params.require(:item).permit(:name,:description,:condition,:shipping_method,:shipping_charge,:ship_from_region,:shipping_date,:price, itemimages_attributes: [:id, :image])
  end
end
