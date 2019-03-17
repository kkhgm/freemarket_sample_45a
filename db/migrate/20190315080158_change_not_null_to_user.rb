class ChangeNotNullToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :last_name, true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name_kana, true
    change_column_null :users, :first_name_kana, true
    change_column_null :users, :birthday_info, true
  end
end
