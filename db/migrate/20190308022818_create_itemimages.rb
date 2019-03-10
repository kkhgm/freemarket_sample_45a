class CreateItemimages < ActiveRecord::Migration[5.2]
  def change
    create_table :itemimages do |t|
      t.string :images, null: false
      t.timestamps
    end
  end
end
