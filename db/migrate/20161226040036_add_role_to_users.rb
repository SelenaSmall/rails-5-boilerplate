class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :role, :integer, null: false
  end

  def self.down
  	remove_column :users, :role
  end
end
