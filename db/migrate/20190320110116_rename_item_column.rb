class RenameItemColumn < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :trades, :item, :item_id
  end
  def self.down
    rename_column :trades, :item_id, :item
  end
end
