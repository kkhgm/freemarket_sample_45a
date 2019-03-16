class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :sns_credentials, :provider, :string, unique: false
  end
end
