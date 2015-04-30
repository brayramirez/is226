class CreateBidderAccounts < ActiveRecord::Migration
  def change
    create_table :bidder_accounts do |t|
      t.timestamps null: false
    end
  end
end
