class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :item, unique: true
      t.string :status, null: false

      t.timestamps
    end
  end
end
