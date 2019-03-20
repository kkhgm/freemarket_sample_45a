class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :card_token, unique: true

      t.timestamps
    end
  end
end
