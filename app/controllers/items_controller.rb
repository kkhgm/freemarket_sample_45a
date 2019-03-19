class ItemsController < ApplicationController

  before_action :set_item, except:[:index, :new, :create, :search,:catesearch ]

  def index
    @items = Item.order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
    @item.item_categories.build
    @item.itemimages.build
  	@regions = Region.all
    @categories = Category.where(parent_id: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      @regions = Region.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @other_items = Item.where( [ "id != ? and seller_id = ?", params[:id], @item.seller_id ] ).order("created_at DESC").limit(6)
    @itemimage = Itemimage.find_by(params[:id], item_id: @item)
    @itemimages = Itemimage.where("item_id = ?", @item).limit(10)
  end

  def edit
    @categories = Category.where(parent_id: nil)
    @regions = Region.all
  end

  def update
    if @item.update(item_params)
      redirect_to action: "index"
    else
      render :action => "edit"
    end
  end

   def destroy
    if @item.destroy
      redirect_to action: "index"
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  def search
    @items = Item.where("name LIKE :text OR description LIKE :text", text: "%#{params[:text]}%").order("created_at DESC")
    if params[:text].present? == false || @items.length == 0
      @items = []
      @newitems = Item.all.order("created_at DESC").limit(48)
    end
  end

  def catesearch
    @cate_childrens = Category.where("parent_id = ?", params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:condition,:shipping_method,:shipping_charge,:ship_from_region,:shipping_date,:price,:seller_id,:buyer_id,itemimages_attributes: [:id, :image], item_categories_attributes:[:id, :category_id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
