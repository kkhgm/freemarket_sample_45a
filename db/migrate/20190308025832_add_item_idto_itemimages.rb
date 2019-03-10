class AddItemIdtoItemimages < ActiveRecord::Migration[5.2]
  def change
  	add_reference :itemimages, :item, foreign_key: true
  end
end
