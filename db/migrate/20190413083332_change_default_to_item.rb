class ChangeDefaultToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :price, :integer, null: false, default: 300
  end

  def down
    change_column :items, :price, :integer, null: false
  end
end
