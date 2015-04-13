class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :order, :index => true
      t.references :bidder_account, :index => true
      t.text :content, :null => false
      t.integer :status, :default => Bid.statuses[:open]

      t.timestamps null: false
    end
  end
end
