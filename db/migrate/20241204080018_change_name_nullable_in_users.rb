class ChangeNameNullableInUsers < ActiveRecord::Migration[6.1]
  def change
    if table_exists?(:users) && column_exists?(:users, :name)
      change_column_null :users, :name, true
    end
  end
end
