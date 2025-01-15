class RemoveAddressFromUsers < ActiveRecord::Migration[6.1]
  def change
    if column_exists?(:users, :address)
      remove_column :users, :address, :string
    end
  end
end
