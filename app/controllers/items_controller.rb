class ItemsController < ApplicationController

  layout 'singlepage', only: :new

  def index
<<<<<<< HEAD
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
=======
    @items = Item.order("created_at DESC").limit(4)
>>>>>>> yu40ta/master
  end

  def show

  end
end
