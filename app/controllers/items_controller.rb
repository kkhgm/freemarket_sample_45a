class ItemsController < ApplicationController

  layout 'singlepage', only: :new

  def index
  end

  def new
  	@item = Item.new
    # @item.build_item_images
  	@regions = Region.all
  end

  def create
  	@item = Item.create(item_params)
    binding.pry
    redirect_to controller: :items, action: :index
  end

  private
  def item_params
  	params.require(:item).permit(:name,:description,:condition,:shipping_method,:shipping_charge,:ship_from_region,:shipping_date,:price)
  end

  def show

  end
end
