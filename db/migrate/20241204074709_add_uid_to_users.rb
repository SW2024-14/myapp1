class AddUidToUsers < ActiveRecord::Migration[6.1]
  def change
    if table_exists?(:users)
      add_column :users, :uid, :string
    end
  end
end
