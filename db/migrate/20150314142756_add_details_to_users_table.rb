class AddDetailsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :company_name, :string
    add_column :users, :contact_person, :string
    add_column :users, :contact_number, :string
    add_column :users, :disabled, :boolean, :default => false
    add_column :users, :role_id, :integer
    add_column :users, :role_type, :string

    add_index :users, [:role_id, :role_type]
  end
end
