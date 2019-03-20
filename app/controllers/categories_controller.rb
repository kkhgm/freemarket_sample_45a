class CategoriesController < ApplicationController

  def index
    @categories = Category.eager_load(children: :children).where(parent_id: nil)
  end

  def show
    @items = Category.find(params[:id]).items
    @newitems = Item.all.order("created_at DESC").limit(48)
  end

end
