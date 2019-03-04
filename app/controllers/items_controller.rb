class ItemsController < ApplicationController

  layout 'singlepage', only: :new

  def index
  end
  def new
  	@item = Item.new
  end
end
