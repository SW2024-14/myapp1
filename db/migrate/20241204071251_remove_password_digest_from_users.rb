class RemovePasswordDigestFromUsers < ActiveRecord::Migration[6.1]
  def change
    if table_exists?(:users) && column_exists?(:users, :password_digest)
      remove_column :users, :password_digest, :string
    end
  end
end
