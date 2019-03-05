class ItemsController < ApplicationController

  layout 'singlepage', only: :new

  def index
  end

  def new
  	@item = Item.new
  	@regions = Region.all
  	@select = params[:shipping_charge]
  end

  def create
  	@item = Item.create(item_params)
  end

  private
  def item_params
  	params.permit(:name,:description,:shipping_method,:shipping_change,:ship_from_region,:shipping_date,:price)
  end
end
