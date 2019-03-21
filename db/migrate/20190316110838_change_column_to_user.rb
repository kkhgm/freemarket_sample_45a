class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :sns_credentials, :provider, :string, unique: false
  end

  def down
    change_column :sns_credentials, :provider, :string, unique: true
  end
end
