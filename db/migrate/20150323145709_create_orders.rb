class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :buyer_account, :index => true
      t.string :item, :null => false
      t.integer :quantity, :default => 0
      t.decimal :budget, :precision => 8, :scale => 2, :default => 0.0
      t.date :target
      t.text :details
      t.integer :status, :default => Order.statuses[:open]

      t.timestamps null: false
    end
  end
end
