class CreateBuyerAccounts < ActiveRecord::Migration
  def change
    create_table :buyer_accounts do |t|
      t.integer :buyer_type

      t.timestamps null: false
    end
  end
end
