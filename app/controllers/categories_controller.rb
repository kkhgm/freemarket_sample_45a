class CategoriesController < ApplicationController

  def index
    @categories = Category.eager_load(children: :children).where(parent_id: nil)

  end

end
