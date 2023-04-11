class AddUserRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :roleId, :string
  end
end
