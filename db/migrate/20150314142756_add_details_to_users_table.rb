class AddDetailsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :account_type, :integer,
      :default => 0, :null => false, :index => true
    add_column :users, :company_name, :string
    add_column :users, :contact_person, :string
    add_column :users, :contact_number, :string
    add_column :users, :buyer_type, :integer,
      :default => 0, :null => false, :index => true
    add_column :users, :disabled, :boolean,
      :default => false
  end
end
