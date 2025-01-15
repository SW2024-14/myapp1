class RemovePhoneFromUsers < ActiveRecord::Migration[6.1]
  def change
    if column_exists?(:users, :phone)
      remove_column :users, :phone, :string
    end
  end
end
