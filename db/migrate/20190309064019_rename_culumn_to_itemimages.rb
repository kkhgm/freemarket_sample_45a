class RenameCulumnToItemimages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :itemimages, :images, :image
  end
end
