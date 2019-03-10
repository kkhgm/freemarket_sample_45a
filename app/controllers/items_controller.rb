class ItemsController < ApplicationController

  # before_action :set_item, except:[:index, :show]

  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
  	@item = Item.new
    @item.itemimages.build
  	@regions = Region.all
  end

  def create
  	@item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    end
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
      flash[:notice] = "削除に失敗しました"
    end
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  private
  def item_params
  	params.require(:item).permit(:name,:description,:condition,:shipping_method,:shipping_charge,:ship_from_region,:shipping_date,:price, itemimages_attributes: [:id, :image])
  end
end
